#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:         The Master

    Script Function: Attack Bottom Th type
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------




Opt("SendKeyDownDelay",100)


Func SwitchAttackBottomTH($numperspot , $spots)

Switch ($BottomTHType + 1)

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
							Click(Random(8,100,1),Random(250,270,1))
							If _Sleep(Random(70,100)) Then Return
						Next
			EndIf

			If $THside=3 Then
						If $debugSetlog = 1 Then Setlog("Right Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots
							If CheckOneStar() Then Return
							   Click(Random(730,850,1),Random(280,335,1))
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
					_Sleep(3000)
					$zoomedin = True
EndIf
;End zooming and scrolling ____________________________________________________________

    ;Attacking ________________________________________________________________________
    If $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then

					    If $debugSetlog = 1 Then Setlog("Center Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
						For $count = 1 to $numperspot * $spots

							If CheckOneStar() Then Return
							Click(Random(460,560,1),Random(564,566,1))
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

			If $THside=1 Then
				If $debugSetlog = 1 Then Setlog("Left Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
					For $count = 1 to $numperspot * $spots
						    If CheckOneStar() Then Return
							Click(Random($Thx-70,$Thx-40,1),Random(564,566,1))
							If _Sleep(Random(70,100)) Then Return
					Next
			EndIf

            If $THside=3 Then
				If $debugSetlog = 1 Then Setlog("Right Bottom deployment THi = "&$THi&" ,x = "&$Thx &" ,y = "&$Thy)
					For $count = 1 to $numperspot * $spots
						    If CheckOneStar() Then Return
							Click(Random($Thx+40,$Thx+70,1),Random(564,566,1))
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