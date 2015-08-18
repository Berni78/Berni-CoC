#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: djbooya  ( Modified By Me)

    Script Function: Check Dark Full
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------








GUICtrlSetData ( $cmbBotCond ,"Dark Elixir Full|Gold and Dark Elixir Full|Elixir and Dark Elixir Full|Gold and Elixir and Dark Full")

;Checks if your Dark Elixir Storage are full
 Func isDarkElixirFull()
 	_CaptureRegion()
 	;-----------------------------------------------------------------------------
 	If _ColorCheck(_GetPixelColor(707, 132), Hex(0x000000, 6), 6) Then ;Hex is black
 		If _ColorCheck(_GetPixelColor(709, 132), Hex(0x190026, 6), 6) Then ;Hex if color of darkk elixir (close to black)
 			SetLog("Dark Elixir Storage are full!", $COLOR_GREEN)
			Return True
		EndIf
	EndIf

	Return False
 EndFunc   ;==>isDarkElixirFull



Func DarkFullConditions()
Switch $cmbBotCond
Case 17
	If isDarkElixirFull() Then $MeetCondStop = True
case 18
    If isGoldFull() And isDarkElixirFull() Then $MeetCondStop = True
Case 19
    If isElixirFull() And isDarkElixirFull() Then $MeetCondStop = True
Case 20
    If isGoldFull() And isElixirFull() And isDarkElixirFull() Then $MeetCondStop = True
EndSwitch

EndFunc
