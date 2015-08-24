#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: Training Order
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------


Global $TroopGroup[10][3] = [["Pekk", 9, 25], ["Drag", 8, 20], ["Heal", 7, 14], ["Wiza", 6, 4], ["Ball", 5, 5], ["Giant", 2, 5], ["Wall", 4, 2], ["Gobl", 3, 1], ["Barb", 0, 1], ["Arch", 1, 1]]
Global $THSnipeTroopGroup[10][3] = [["Arch", 1, 1] , ["Barb", 0, 1] , ["Giant", 2, 5] , ["Wall", 4, 2] , ["Ball", 5, 5] , ["Wiza", 6, 4] ,["Heal", 7, 14] , ["Drag", 8, 20], ["Pekk", 9, 25] , ["Gobl", 3, 1]]
Global $TroopGroupDark[6][3] = [ ["Lava", 5, 30] , ["Gole", 3, 30] , ["Witc", 4, 12] , ["Valk", 2, 8] ,  ["Hogs", 1, 5] , ["Mini", 0, 2]]




Func SetTroopsTh()
	If $OptTrophyMode = 1 Or $iChkSnipeWhileTrain = 1 Then
		for $i=0 to Ubound($THSnipeTroopGroup,1) - 1
			$TroopName[$i]         	= $THSnipeTroopGroup[$i][0]
			$TroopNamePosition[$i] 	= $THSnipeTroopGroup[$i][1]
			$TroopHeight[$i]       	= $THSnipeTroopGroup[$i][2]
		next
	EndIf
EndFunc

Func RevertTroopsNormal()
	If $OptTrophyMode = 0 and $iChkSnipeWhileTrain = 0 Then

	For $i = 0 To UBound($TroopGroup, 1) - 1
	    $TroopName[$i]              = $TroopGroup[$i][0]
	    $TroopNamePosition[$i]      = $TroopGroup[$i][1]
	    $TroopHeight[$i]            = $TroopGroup[$i][2]
    Next

	EndIf
EndFunc

