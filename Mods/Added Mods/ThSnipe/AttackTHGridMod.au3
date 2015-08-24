#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: The Master

    Script Function: AttackTHGridMod
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------
;Created by The Master

Func AttackTHGridMod($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)
	Local $aThx, $aThy, $num
	Local $TroopCountBeg
	If $iMatchMode = $TS Or $chkATH = 1 And SearchTownHallLoc() Then

		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then Return ;exit if 1 star

		Local $THtroop = -1
		Local $troopNb = 0
		Local $name = ""
		For $i = 0 To UBound($atkTroops) - 1
			If $atkTroops[$i][0] = $troopKind Then
				$THtroop = $i
				$troopNb = $spots * $numperspot
				Local $plural = 0
				If $troopNb > 1 Then $plural = 1
				$name = NameOfTroop($troopKind, $plural)
			EndIf
		Next

		If  $troopKind >= $eLSpell And $troopKind <= $eHaSpell Then
			SpellTHGrid($troopKind)
			Return
		EndIf


	    If $troopKind = $eKing Or $troopKind = $eQueen Or $troopKind = $eCastle Then
			If ($THtroop = -1) Then Return False
			$spots = 1
			$numperspot = 1
			$troopNb = 1
			$BoolDropHeroes = 0
		    SetLog("Dropping " & $name, $COLOR_GREEN)
			If $troopKind = $eKing Then $checkKPower = True
			If $troopKind = $eQueen Then $checkQPower = True

	    EndIf

	    If $troopKind >= $eBarb And $troopKind <= $eLava Then
			$TroopCountBeg = Number(ReadTroopQuantity($THtroop))

			If ($THtroop = -1) Or ($TroopCountBeg = 0) Then SetLog("No " & $name & " troop Found!!!")
		    If ($THtroop = -1) Or ($TroopCountBeg = 0) Then Return False

		    Local $waveName = "first"
		    If $waveNb = 2 Then $waveName = "second"
		    If $waveNb = 3 Then $waveName = "third"
		    If $maxWaveNb = 1 Then $waveName = "only"
		    If $waveNb = 0 Then $waveName = "last"
		    SetLog("Dropping " & $waveName & " wave of " & $troopNb & " " & $name, $COLOR_GREEN)
		EndIf


		SelectDropTroop($THtroop) ;Select Troop
		If _Sleep(500) Then Return

		If $THi <= 15 Or $THside = 0 Or $THside = 2 Then
			Switch $THside
				Case 0 ;UL
					For $num = 0 To $numperspot - 1
						For $ii = $THi - 1 To $THi - 1 + ($spots - 1)
							$aThx = 25 + $ii * 19
							$aThy = 314 - $ii * 14
							If CheckOneStar() Then Return
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0019")
							If _Sleep(Random(30, 60)) Then Return
						Next
					Next
				Case 1 ;LL
					For $num = 0 To $numperspot - 1
						For $ii = $THi To $THi + ($spots - 1)
							$aThx = 25 + $ii * 19
							$aThy = 314 + $ii * 14
							If CheckOneStar() Then Return
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0020")
							If _Sleep(Random(30, 60)) Then Return
						Next
					Next
				Case 2 ;UR
					For $num = 0 To $numperspot - 1
						For $ii = $THi To $THi + ($spots - 1)
							$aThx = 830 - $ii * 19
							$aThy = 314 - $ii * 14
							If CheckOneStar() Then Return
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0021")
							If _Sleep(Random(30, 60)) Then Return
						Next
					Next
				Case 3 ;LR
					For $num = 0 To $numperspot - 1
						For $ii = $THi + 1 To $THi + 1 + ($spots - 1)
							$aThx = 830 - $ii * 19
							$aThy = 314 + $ii * 14
							If CheckOneStar() Then Return
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0022")
							If _Sleep(Random(30, 60)) Then Return
						Next
					Next
			EndSwitch
		EndIf

		If $THi > 15 And ($THside = 1 Or $THside = 3) Then SwitchAttackBottomTH($numperspot , $spots)

		If $troopKind >= $eBarb And $troopKind <= $eLava Then
		    If $TroopCountBeg <> Number(ReadTroopQuantity($THtroop)) Then
			   SetLog("Deployment of " & $name & " was Successful!")
			   If _Sleep($Sleep) Then Return
		    Else
			   SetLog("Deployment of " & $name & " wasn't Successful!")
		    EndIf
        EndIf

        If $BoolDropHeroes = True Then ALLDropheroes($aThx, $aThy)
	EndIf

EndFunc   ;==>AttackTHGridMod