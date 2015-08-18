#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: by Zombie  ( Modified By The Master)

    Script Function: Locate king and Queen Alters
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------


Func LocateKingAltar()
	Local $stext, $MsgBox, $iSilly = 0, $iStupid = 0, $sErrorText = "", $sInfo
    $RunState = True
	WinActivate($Title)
	checkMainScreen(False)
	Collect()

    SetLog("Locating King Altar...", $COLOR_BLUE)
	While 1
		ClickP($aTopLeftClient)
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 500)
		$stext =  $sErrorText & @CRLF & "Click OK then click on your King Altar" & @CRLF & @CRLF & _
		"Do not move mouse after clicking location"& @CRLF & @CRLF & "Make sure the building name is visible for me!" & @CRLF
		$MsgBox = _ExtMsgBox(0, "Ok|Cancel", "Locate King Altar", $stext, 15, $frmBot)
		If $MsgBox = 1 Then
			$HWnD = WinGetHandle($Title)
			WinActivate($HWnD)
			$KingPos[0] = FindPos()[0]
			$KingPos[1] = FindPos()[1]
			If isInsideDiamond($KingPos) = False Then
				$iStupid += 1
				Select
					Case $iStupid = 1
						$sErrorText = "King Altar Location Not Valid!"&@CRLF
						SetLog("Location not valid, try again", $COLOR_RED)
						ContinueLoop
					Case $iStupid = 2
						$sErrorText = "Please try to click inside the grass field!" & @CRLF
						ContinueLoop
					Case $iStupid = 3
						$sErrorText = "This is not funny, why did you click @ (" & $KingPos[0] & "," & $KingPos[1] & ")?" & @CRLF & "  Please stop!" & @CRLF & @CRLF
						ContinueLoop
					Case $iStupid = 4
						$sErrorText = "Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
						ContinueLoop
					Case $iStupid > 4
						SetLog(" Operator Error - Bad King Altar Location: " & "(" & $KingPos[0] & "," & $KingPos[1] & ")", $COLOR_RED)
						ClickP($aTopLeftClient)
						Return False
					Case Else
						SetLog(" Operator Error - Bad King Altar Location: " & "(" & $KingPos[0] & "," & $KingPos[1] & ")", $COLOR_RED)
						$KingPos[0] = -1
						$KingPos[1] = -1
						ClickP($aTopLeftClient)
						Return False
				EndSelect
			EndIf
			SetLog("King Altar: " & "(" & $KingPos[0] & "," & $KingPos[1] & ")", $COLOR_GREEN)
		Else
			SetLog("Locate King Altar Cancelled", $COLOR_BLUE)
			ClickP($aTopLeftClient)
			Return
		EndIf

		;Get King info
		$sInfo = BuildingInfo(242, 520)
		If @error Then SetError (0,0,0)
		local $CountGetInfo = 0
		While IsArray ($sInfo) = False
		$sInfo = BuildingInfo(242, 520)
		If @error Then SetError (0,0,0)
	    Sleep(100)
		$CountGetInfo +=1
		If $CountGetInfo = 50 Then Return
		WEnd
        SetLog ($sInfo[1] & $sInfo[2])
		If @error Then Return SetError (0,0,0)

		If $sInfo[0] > 1 Or $sInfo[0] = "" Then

			If  (StringInStr($sInfo[1], "Barb") = 0) And (StringInStr($sInfo[1], "King") = 0) Then
				If $sInfo[0] = "" Then
					$sLocMsg = "Nothing"
				Else
					$sLocMsg = $sInfo[1]
				EndIf
				$iSilly += 1
				Select
					Case $iSilly = 1
						$sErrorText = "Wait, That is not the King Altar?, It was a " & $sLocMsg & @CRLF
						ContinueLoop
					Case $iSilly = 2
						$sErrorText = "Quit joking, That was " & $sLocMsg & @CRLF
						ContinueLoop
					Case $iSilly = 3
						$sErrorText = "This is not funny, why did you click " & $sLocMsg & "? Please stop!" & @CRLF
						ContinueLoop
					Case $iSilly = 4
						$sErrorText = $sLocMsg&" ?!?!?!"&@CRLF&@CRLF&"Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
						ContinueLoop
					Case $iSilly > 4
						SetLog("Quit joking, Click the King Altar, or restart bot and try again", $COLOR_RED)
						$KingPos[0] = -1
						$KingPos[1] = -1
						ClickP($aTopLeftClient)
						Return False
				EndSelect
			EndIf
		Else
			SetLog(" Operator Error - Bad King Altar Location: " & "(" & $KingPos[0] & "," & $KingPos[1] & ")", $COLOR_RED)
			$KingPos[0] = -1
			$KingPos[1] = -1
			ClickP($aTopLeftClient)
			Return False
		EndIf
		ExitLoop
	WEnd

	ClickP($aTopLeftClient, 1, 200, "#0327")
	If _Sleep(1000) Then Return

	_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 500)
	$stext = "Now you can remove mouse out of bluestacks, Thanks!!"
	$MsgBox = _ExtMsgBox(48, "OK", "Notice!", $stext, 15, $frmBot)

IniWrite($building, "other", "xKing", $KingPos[0])
IniWrite($building, "other", "yKing", $KingPos[1])

EndFunc   ;==>LocateKingAltar

Func LocateQueenAltar()
	Local $stext, $MsgBox, $iSilly = 0, $iStupid = 0, $sErrorText = "", $sInfo

    $RunState = True
	WinActivate($Title)
	checkMainScreen(False)
	Collect()

	SetLog("Locating Queen Altar...", $COLOR_BLUE)
	While 1
		ClickP($aTopLeftClient)
		_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 500)
		$stext =  $sErrorText & @CRLF & "Click OK then click on your Queen Altar" & @CRLF & @CRLF & _
		"Do not move mouse after clicking location"& @CRLF & @CRLF & "Make sure the building name is visible for me!" & @CRLF
		$MsgBox = _ExtMsgBox(0, "Ok|Cancel", "Locate Queen Altar", $stext, 15, $frmBot)
		If $MsgBox = 1 Then
			$HWnD = WinGetHandle($Title)
			WinActivate($HWnD)
			$QueenPos[0] = FindPos()[0]
			$QueenPos[1] = FindPos()[1]
			If isInsideDiamond($QueenPos) = False Then
				$iStupid += 1
				Select
					Case $iStupid = 1
						$sErrorText = "Queen Altar Location Not Valid!"&@CRLF
						SetLog("Location not valid, try again", $COLOR_RED)
						ContinueLoop
					Case $iStupid = 2
						$sErrorText = "Please try to click inside the grass field!" & @CRLF
						ContinueLoop
					Case $iStupid = 3
						$sErrorText = "This is not funny, why did you click @ (" & $QueenPos[0] & "," & $QueenPos[1] & ")?" & @CRLF & "  Please stop!" & @CRLF & @CRLF
						ContinueLoop
					Case $iStupid = 4
						$sErrorText = "Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
						ContinueLoop
					Case $iStupid > 4
						SetLog(" Operator Error - Bad Queen Altar Location: " & "(" & $QueenPos[0] & "," & $QueenPos[1] & ")", $COLOR_RED)
						ClickP($aTopLeftClient)
						Return False
					Case Else
						SetLog(" Operator Error - Bad Queen Altar Location: " & "(" & $QueenPos[0] & "," & $QueenPos[1] & ")", $COLOR_RED)
						$QueenPos[0] = -1
						$QueenPos[1] = -1
						ClickP($aTopLeftClient)
						Return False
				EndSelect
			EndIf
			SetLog("Queen Altar: " & "(" & $QueenPos[0] & "," & $QueenPos[1] & ")", $COLOR_GREEN)
		Else
			SetLog("Locate Queen Altar Cancelled", $COLOR_BLUE)
			ClickP($aTopLeftClient)
			Return
		EndIf

		;get Queen info
		$sInfo = BuildingInfo(242, 520)
		If @error Then SetError (0,0,0)
		local $CountGetInfo = 0
		While IsArray ($sInfo) = False
		$sInfo = BuildingInfo(242, 520)
		If @error Then SetError (0,0,0)
	    Sleep(100)
		$CountGetInfo +=1
		If $CountGetInfo = 50 Then Return
		WEnd
        SetLog ($sInfo[1] & $sInfo[2])
		If @error Then Return SetError (0,0,0)

		If $sInfo[0] > 1 Or $sInfo[0] = "" Then
			If @error Then Return SetError (0,0,0)

			If  StringInStr($sInfo[1], "Quee") = 0 Then
				If $sInfo[0] = "" Then
					$sLocMsg = "Nothing"
				Else
					$sLocMsg = $sInfo[1]
				EndIf
				$iSilly += 1
				Select
					Case $iSilly = 1
						$sErrorText = "Wait, That is not the Queen Altar?, It was a " & $sLocMsg & @CRLF
						ContinueLoop
					Case $iSilly = 2
						$sErrorText = "Quit joking, That was " & $sLocMsg & @CRLF
						ContinueLoop
					Case $iSilly = 3
						$sErrorText = "This is not funny, why did you click " & $sLocMsg & "? Please stop!" & @CRLF
						ContinueLoop
					Case $iSilly = 4
						$sErrorText = $sLocMsg&" ?!?!?!"&@CRLF&@CRLF&"Last Chance, DO NOT MAKE ME ANGRY, or" & @CRLF & "I will give ALL of your gold to Barbarian King," & @CRLF & "And ALL of your Gems to the Archer Queen!"& @CRLF
						ContinueLoop
					Case $iSilly > 4
						SetLog("Quit joking, Click the Queen Altar, or restart bot and try again", $COLOR_RED)
						$QueenPos[0] = -1
						$QueenPos[1] = -1
						ClickP($aTopLeftClient)
						Return False
				EndSelect
			EndIf
		Else
			SetLog(" Operator Error - Bad Queen Altar Location: " & "(" & $QueenPos[0] & "," & $QueenPos[1] & ")", $COLOR_RED)
			$QueenPos[0] = -1
			$QueenPos[1] = -1
			ClickP($aTopLeftClient)
			Return False
		EndIf
		ExitLoop
	WEnd

	ClickP($aTopLeftClient, 1, 200, "#0327")
	If _Sleep(1000) Then Return

	_ExtMsgBoxSet(1 + 64, $SS_CENTER, 0x004080, 0xFFFF00, 12, "Comic Sans MS", 500)
	$stext = "Now you can remove mouse out of bluestacks, Thanks!!"
	$MsgBox = _ExtMsgBox(48, "OK", "Notice!", $stext, 15, $frmBot)

IniWrite($building, "other", "xQueen", $QueenPos[0])
IniWrite($building, "other", "yQueen", $QueenPos[1])

EndFunc   ;==>LocateQueenAltar