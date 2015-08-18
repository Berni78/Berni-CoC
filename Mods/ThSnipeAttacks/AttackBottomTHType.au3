#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:         The Master

    Script Function: Attack Bottom Th type
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Local $x = 30, $y = 260

GUISwitch($frmBot, $tabAttackAdv)

GUICtrlDelete ( $grpAtkCombos )
$grpAtkCombos = GUICtrlCreateGroup("Advanced Attack Combo's", $x - 20, $y - 20, 225, 220)
    $y = 400
	$lblAttackBottomType = GUICtrlCreateLabel("Attack Bottom base", $x -20 , $y + 5, -1, 17, $SS_RIGHT)
    $cmbAttackbottomType = GUICtrlCreateCombo("",  $x + 95, $y, 105, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1:MaxZoomed|2:ModerateZoomed|3:SideAttack|4:MaxZoomed2|5:OriginalMaxZoom", "3:SideAttack")
	GUICtrlSetOnEvent(-1, "cmbAttackbottomType")
	GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 27
	$btnSnipeOnlyMode = GUICtrlCreateButton ("Snipe Only Mode", $x, $y, 90,30)
		$txtTip = "Changes Your Settings so that the bot will only snipe Th ouside with no other attack types"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "ChangeSettingsSnipeOnly")
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")


Opt("SendKeyDownDelay",100)

Func cmbAttackbottomType()
IniWrite($config, "advanced", "BottomTHType", _GUICtrlComboBox_GetCurSel($cmbAttackbottomType))
EndFunc

Func SwitchAttackBottomTH($numperspot , $spots)

Switch (_GUICtrlComboBox_GetCurSel($cmbAttackbottomType) + 1)

    Case 1
		AllZoomedAttack($numperspot , $spots)
	Case 2
		ModerateZoomed($numperspot , $spots)
	Case 3
		SideSnipe($numperspot , $spots)
	Case 4
        MaxZoomed2($numperspot , $spots)
	Case 5
		OriginalMaxZoomed($numperspot , $spots)
EndSwitch

EndFunc

Func ChangeSettingsSnipeOnly()

GUICtrlSetData ( $txtDBMinGold,"999999" )
GUICtrlSetData ( $txtDBMinElixir, "999999" )
GUICtrlSetData ( $txtABMinGold, "999999" )
GUICtrlSetData ( $txtABMinElixir, "999999" )
GUICtrlSetState($chkTrophyMode, $GUI_CHECKED)
chkSnipeModeAdd()
GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, "0")
_GUICtrlComboBox_SetCurSel($cmbABMeetGE, "0")
cmbDBGoldElixir()
cmbABGoldElixir()
SetLog("Your settings have been changed to Snipe only mode")
EndFunc

Func AllZoomedAttack($numperspot , $spots)
Local $count = 0

;Zooming and scrolling _______________________________________________________________
If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
SendKeepActive ($Title)
	SetLog("Attacking Th With Master Zoomed Max Mod ...")
					;Zoom in all the way
					SetLog("Zooming in Max...")
					While $zCount < 5
						If _Sleep(200) Then Return
						ControlSend($Title, "", "", "{UP}")
						If _Sleep(Random(600,620)) Then Return
						$zCount += 1
					WEnd
					SetLog("Done zooming.")

					;Scroll to bottom
					SetLog("Scrolling to bottom...")

					While $sCount < 8
						ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						If _Sleep(600) Then Return
						$sCount += 1
					WEnd

					ControlSend($Title, "", "", "{CTRLDOWN}{LEFT}{CTRLUP}")
					ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
					ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						If _Sleep(2000) Then Return
					$zoomedin = True
EndIf
;End zooming and scrolling_______________________________________________________________

	;Attacking __________________________________________________________________________
	If $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then

					    If $debugSetlog = 1 Then Setlog("Center Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							Click(Random(350,500,1),Random(515,560,1))
							If _Sleep(Random(70,100)) Then Return
						Next

	Else
			If $THside=1 Then
						If $debugSetlog = 1 Then Setlog("Left Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							Click(Random(280,380,1),Random(365,420,1))
							If _Sleep(Random(70,100)) Then Return
						Next
			EndIf

			If $THside=3 Then
						If $debugSetlog = 1 Then Setlog("Right Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							   Click(Random(780,855,1),Random(400,560,1))
							   If _Sleep(Random(70,100)) Then Return
						Next
			EndIf

	EndIf
EndFunc

Func MaxZoomed2($numperspot , $spots)

;Zooming and Dragging _______________________________________________________________
If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
SendKeepActive ($Title)
                    ;Zoom in all the way
					SetLog("MaxdZoomed2...")
					SetLog("Zooming in Max With Scrolling ...")

					While $zCount < 3 And $sCount < 3
						ControlSend($Title, "", "", "{UP}")
						If _Sleep(600) Then Return
						ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						If _Sleep(600) Then Return
						ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						If _Sleep(600) Then Return
						$zCount += 1
						$sCount += 1
					WEnd

					ControlSend($Title, "", "", "{CTRLDOWN}{LEFT}{CTRLUP}")
					ControlSend($Title, "", "", "{UP}")
					ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
					ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")

					SetLog("Done zooming.")
		            If _Sleep(2000) Then Return
                     $zoomedin = True
;End zooming and Dragging_______________________________________________________________
	;Attacking __________________________________________________________________________
	If $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then

					    If $debugSetlog = 1 Then Setlog("Center Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							Click(Random(350,500,1),Random(515,560,1))
							If _Sleep(Random(70,100)) Then Return
						Next

	Else
			If $THside=1 Then
						If $debugSetlog = 1 Then Setlog("Left Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							Click(Random(280,380,1),Random(365,420,1))
							If _Sleep(Random(70,100)) Then Return
						Next
			EndIf

			If $THside=3 Then
						If $debugSetlog = 1 Then Setlog("Right Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							   Click(Random(780,855,1),Random(400,560,1))
							   If _Sleep(Random(70,100)) Then Return
						Next
	        EndIf


    EndIf
EndIf
EndFunc



Func ModerateZoomed($numperspot , $spots)
Local $count


;Zooming and scrolling _______________________________________________________________
If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
SendKeepActive ($Title)
	SetLog("Attacking Th With Master Moderate Zoomed Mod ...")
					;Few zooming and Scrolling to bottom
					SetLog("Zooming in a little and scrolling to bottom ...")
					While $zCount < 2 And $sCount < 2
						ControlSend($Title, "", "", "{UP}")
						If _Sleep(300) Then Return
						ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						If _Sleep(400) Then Return
						$zCount += 1
						$sCount += 1
					WEnd
					If $debugSetlog = 1 Then SetLog("Done zooming.")
					_Sleep(500)
					$zoomedin = True
EndIf
;End zooming and scrolling ____________________________________________________________

    ;Attacking ________________________________________________________________________
    If $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then

					    If $debugSetlog = 1 Then Setlog("Center Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots

							If CheckOneStar() Then Return
							Click(Random(450,510,1),Random(564,566,1))
							If _Sleep(Random(70,100)) Then Return
						Next

    Else
			If $THside=1 Then
						If $debugSetlog = 1 Then Setlog("Left Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots

							If CheckOneStar() Then Return
							Click(Random(290,340,1),Random(564,566,1))
							If _Sleep(Random(70,100)) Then Return
						Next
			EndIf

			If $THside=3 Then
						If $debugSetlog = 1 Then Setlog("Right Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots

							If CheckOneStar() Then Return
							Click(Random(630,700,1),Random(564,566,1))
							If _Sleep(Random(70,100)) Then Return
						Next

			EndIf
    EndIf
 EndFunc

Func SideSnipe($numperspot , $spots)
Local $count
local $i=0
SetLog("Attacking Th With Master No Zoom side attack Mod ...")

	;Attacking ________________________________________________________________________
    If $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then
			        If $debugSetlog = 1 Then Setlog("Center Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
			        For $count = 1 to $numperspot * $spots
						If $i=0 then

							If CheckOneStar() Then Return
							Click(Random(355,365,1),Random(564,566,1))
							$i=1
						Else

							If CheckOneStar() Then Return
							Click(Random(488,500,1),Random(564,566,1))
							$i=0
						EndIf
				        If _Sleep(Random(70,100)) Then Return
			        Next
    Else

			If $THside=1 Or $THside=3 Then
				If $debugSetlog = 1 Then Setlog("Not Center Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
					For $count = 1 to $numperspot * $spots
						    If CheckOneStar() Then Return
							Click(Random($Thx-5,$Thx+5,1),Random(564,566,1))
							If _Sleep(Random(70,100)) Then Return
					Next
			EndIf


	EndIf

EndFunc


Func OriginalMaxZoomed($numperspot , $spots)
Local $count
				If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
				;Zoom in all the way
				SetLog("Zooming in...")
				While $zCount < 6
					If _Sleep(300) Then Return
					ControlSend($Title, "", "", "{UP}")
					If _Sleep(100) Then Return
					$zCount += 1
				WEnd
				SetLog("Done zooming.")
				If _Sleep(500) Then Return

				;Scroll to bottom
				SetLog("Scrolling to bottom...")
				While $sCount < 7
					If _Sleep(300) Then Return
					ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
					If _Sleep(100) Then Return
					$sCount += 1
				WEnd
				$zoomedin = True
				EndIf

			If $THside = 1 Then
				;						Setlog("LL Bottom deployment $THi="&$THi)
				For $count = 0 To $numperspot - 1
					For $ii = $THi + 1 To $THi + 1 + ($spots - 1)
						$aThx = 830 - $ii * 19
						$aThy = 314 + $ii * 14

						If CheckOneStar() Then Return
						Click(730, 450)
						If _Sleep(Random(30, 60)) Then Return
					Next
					If _Sleep(Random(40, 100)) Then Return
				Next
			EndIf

			If $THside = 3 Then
				;						Setlog("LR Bottom deployment $THi="&$THi)
				For $count = 0 To $numperspot - 1
					For $ii = $THi + 1 To $THi + 1 + ($spots - 1)
						$aThx = 830 - $ii * 19
						$aThy = 314 + $ii * 14

						If CheckOneStar() Then Return
						Click(730, 450)
						If _Sleep(Random(30, 60)) Then Return
					Next
					If _Sleep(Random(40, 100)) Then Return
				Next
			EndIf

EndFunc