#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  Mhazwankamal  ( Modified By The Master)

    Script Function: 4 fingers barch
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------


;Attack Settings
 Global $TopLeftFourFingers[5][2] = [[79, 276], [170, 200], [234, 157], [296, 110], [407, 30]]
 Global $TopRightFourFingers[5][2] = [[454, 32], [540, 100], [589, 140], [655, 185], [779, 270]]
 Global $BottomLeftFourFingers[5][2] = [[79, 347], [142, 394], [210, 451], [276, 500], [360, 565]]
 Global $BottomRightFourFingers[5][2] = [[500, 564], [595, 498], [654, 459], [715, 410], [779, 365]]
 Global $EdgesFourFingers[4] = [$BottomRightFourFingers, $TopLeftFourFingers, $BottomLeftFourFingers, $TopRightFourFingers]


GUICtrlSetData($cmbDBDeploy,"4 Fingers Barch")
GUICtrlSetTip($cmbDBDeploy,"Attack on a single side, penetrates through base" & @CRLF & "Attack on two sides, penetrates through base" & @CRLF & "Attack on three sides, gets outer and some inside of base" & @CRLF & "Attack on all sides equally, gets most of outer base" & @CRLF & "Four fingers Barch deployment style", "Select the No. of sides to attack on.")
GUICtrlSetData($cmbDBUnitDelay,"|0|1|2|3|4|5|6|7|8|9|10", "0")


Func IsFourFingersDeploy( $King , $Queen , $CC )

If $iChkDeploySettings[$iMatchMode] <> 5 And $Attack4fingers = False Then Return False
$Attack4fingers = False
 SetLog("Four fingers Barch deployment style", $COLOR_BLUE)

$nbSides = 5  ;change max wave for bar and arch to 1
 Local $listInfoDeploy[11][5] = [[$eGiant, $nbSides, 1, 1, 1] _
 , [$eBarb, $nbSides, 1, 1, 0] _
 , [$eWall, $nbSides, 1, 1, 1] _
 , [$eArch, $nbSides, 1, 1, 0] _
 , [$eGobl, $nbSides, 1, 2, 0] _
 , ["CC", 1, 1, 1, 1] _
 , [$eHogs, $nbSides, 1, 1, 1] _
 , [$eWiza, $nbSides, 1, 1, 0] _
 , [$eMini, $nbSides, 1, 1, 0] _
 , [$eGobl, $nbSides, 2, 2, 0] _
 , ["HEROES", 1, 2, 1, 1] _
 ]


 For $i = 0 To UBound($listInfoDeploy) - 1
			If (IsString($listInfoDeploy[$i][0]) And ($listInfoDeploy[$i][0] = "CC" Or $listInfoDeploy[$i][0] = "HEROES")) Then
				Local $RandomEdge = $EdgesFourFingers[Int(Random(0, 3))]
				Local $RandomXY = Int(Random(0, 4))
				If ($listInfoDeploy[$i][0] = "CC") Then
					dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
				ElseIf ($listInfoDeploy[$i][0] = "HEROES") Then
					dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, $Queen)
				EndIf
			Else
				If LauchTroopFourFingers($listInfoDeploy[$i][0], $listInfoDeploy[$i][1], $listInfoDeploy[$i][2], $listInfoDeploy[$i][3], $listInfoDeploy[$i][4]) Then

				EndIf
			EndIf
 Next

 If _Sleep(100) Then Return
	SetLog("Dropping left over troops", $COLOR_BLUE)
	For $x = 0 To 1
		PrepareAttack($iMatchMode, True) ;Check remaining quantities
		For $i = $eBarb To $eLava ; lauch all remaining troops
			LauchTroop($i, 4, 0, 1)
			CheckHeroesHealth()
			If _Sleep(500) Then Return
		Next
	Next

	;Activate KQ's power
	If ($checkKPower Or $checkQPower) And $iActivateKQCondition = "Manual" Then
		SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating Hero abilities", $COLOR_BLUE)
		_Sleep($delayActivateKQ)
		If $checkKPower Then
			SetLog("Activating King's power", $COLOR_BLUE)
			SelectDropTroop($King)
			$checkKPower = False
		EndIf
		If $checkQPower Then
			SetLog("Activating Queen's power", $COLOR_BLUE)
			SelectDropTroop($Queen)
			$checkQPower = False
		EndIf
	EndIf

	SetLog("Finished Attacking, waiting for the battle to end")


CheckHeroesHealth()
PrepareAttack($iMatchMode, True)
Return True
EndFunc


Func LauchTroopFourFingers($troopKind, $nbSides, $waveNb, $maxWaveNb, $slotsPerEdge = 0)
	Local $troop = -1
	Local $troopNb = 0
	Local $name = ""
	For $i = 0 To UBound($atkTroops) - 1 ; identify the position of this kind of troop
		If $atkTroops[$i][0] = $troopKind Then
			$troop = $i
			$troopNb = Ceiling($atkTroops[$i][1] / $maxWaveNb)
			Local $plural = 0
			If $troopNb > 1 Then $plural = 1
			$name = NameOfTroop($troopKind, $plural)
		EndIf
	Next

	If ($troop = -1) Or ($troopNb = 0) Then
		;if $waveNb > 0 Then SetLog("Skipping wave of " & $name & " (" & $troopKind & ") : nothing to drop" )
		Return False; nothing to do => skip this wave
	EndIf

	Local $waveName = "first"
	If $waveNb = 2 Then $waveName = "second"
	If $waveNb = 3 Then $waveName = "third"
	If $maxWaveNb = 1 Then $waveName = "only"
	If $waveNb = 0 Then $waveName = "last"
	SetLog("Dropping " & $waveName & " wave of " & $troopNb & " " & $name, $COLOR_GREEN)
    DropOnEdgesFourFingers($troop, $nbSides, $troopNb, $slotsPerEdge)
	Return True
EndFunc   ;==>LauchTroopFourFingers

Func DropOnEdgesFourFingers($troop, $nbSides, $number, $slotsPerEdge = 0)
	If $number = 1 Then
		OldDropTroop($troop, $EdgesFourFingers[0], $number);
		Return
	EndIf

	Local $nbTroopsLeft = $number
	If $nbSides = 5 Then
		For $i = 0 To $nbSides - 5 ;3
			Local $nbTroopsPerEdge = Round($nbTroopsLeft / (($nbSides-1) - $i * 2))
			DropOnEdgeFourFingers($troop, $EdgesFourFingers[$i], $nbTroopsPerEdge, $slotsPerEdge, $EdgesFourFingers[$i + 2],$i, $nbSides)
			$nbTroopsLeft -= $nbTroopsPerEdge * 2
		Next
		Return
	EndIf

EndFunc   ;==>LauchTroopFourFingers



Func DropOnEdgeFourFingers($troop, $edge, $number, $slotsPerEdge = 0, $edge2 = -1, $x = -1,$FourFingers = 0)

	If $number = 0 Then Return
	If _Sleep(50) Then Return
	SelectDropTroop($troop) ;Select Troop
	If $FourFingers <> 5 then; if $nbSide = 5
	If _Sleep(300) Then Return
	EndIf
	If $slotsPerEdge = 0 Or $number < $slotsPerEdge Then $slotsPerEdge = $number
	If $number = 1 Or $slotsPerEdge = 1 Then ; Drop on a single point per edge => on the middle
		If Int($edge[2][1]) < 566 Then Click(Int($edge[2][0]), Int($edge[2][1]), $number, 250,"#0102")

		setlog("Drop troop " & $troop)
		If $FourFingers = 5 then Click(Int($TopLeftFourFingers[2][0]),Int($TopLeftFourFingers[2][1]), $number, 250,"#0102")

		If $edge2 <> -1 Then
		If Int($edge2[2][1]) < 566 Then Click(Int($edge2[2][0]),Int($edge2[2][1]), $number, 250,"#0103")

		If $FourFingers = 5 then Click(Int($TopRightFourFingers[2][0]),Int($TopRightFourFingers[2][1]), $number, 250,"#0102")

		Endif


	ElseIf $slotsPerEdge = 2 Then ; Drop on 2 points per edge
		Local $half = Ceiling($number / 2)
		If Int($edge[1][1]) < 566 Then Click(Int($edge[1][0]),Int($edge[1][1]), $half,0,"#0104")

		If $edge2 <> -1 Then

			If Int($edge2[1][1]) < 566 Then Click(Int($edge2[1][0]),Int($edge2[1][1]), $half,0,"#0105")

		EndIf

		If Int($edge[3][1]) < 566 Then Click(Int($edge[3][0]),Int($edge[3][1]), $number - $half,0,"#0106")

		If $edge2 <> -1 Then

		    If Int($edge2[3][1]) < 566 Then Click(Int($edge2[3][0]),Int($edge2[3][1]), $number - $half,0,"#0107")

		EndIf

	Else
        If _Sleep(SetSleep(0)) Then Return
		Local $minX = $edge[0][0]
		Local $maxX = $edge[4][0]
		Local $minY = $edge[0][1]
		Local $maxY = $edge[4][1]
		if $FourFingers = 5 then ; if $nbSide = 5
		Local $minXTL = $TopLeftFourFingers[0][0];addition
		Local $maxXTL = $TopLeftFourFingers[4][0];addition
		Local $minYTL = $TopLeftFourFingers[0][1];addition
		Local $maxYTL = $TopLeftFourFingers[4][1];addition
		endif
		If $edge2 <> -1 Then
			Local $minX2 = $edge2[0][0]
			Local $maxX2 = $edge2[4][0]
			Local $minY2 = $edge2[0][1]
			Local $maxY2 = $edge2[4][1]
			if $FourFingers = 5 then ; if $nbSide = 5
			Local $minX2TR = $TopRightFourFingers[0][0];addition
			Local $maxX2TR = $TopRightFourFingers[4][0];addition
			Local $minY2TR = $TopRightFourFingers[0][1];addition
			Local $maxY2TR = $TopRightFourFingers[4][1];addition
			endif
		EndIf
		Local $nbTroopsLeft = $number + 1
		Local $SpeedThrottle = 0
		$slotsPerEdge =Ceiling($number * 0.75)
        If _Sleep(SetSleep(0)) Then Return
		For $i = 0 To $slotsPerEdge - 1
			Local $nbtroopPerSlot = Round($nbTroopsLeft / ($slotsPerEdge - $i)) ; progressively adapt the number of drops to fill at the best
			if $FourFingers = 5 then ; if $nbSide = 5
				Local $posX = $minX + (($maxX - $minX) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				Local $posY = $minY + (($maxY - $minY) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				If int($posY) < 566 Then Click(Int($posX),int($posY), 1,0,"#0108")

				;Setlog("X = " & $posX & " Y = " & $posY)
				Local $posX = $minXTL + (($maxXTL - $minXTL) * $i) / ($slotsPerEdge - 1);addition
				Local $posY = $minYTL + (($maxYTL - $minYTL) * $i) / ($slotsPerEdge - 1);addition
				If int($posY) < 566 Then Click(Int($posX),Int($posY), 1,0,"#0108") ;addition

			Else
			Local $posX = $minX + (($maxX - $minX) * $i) / ($slotsPerEdge - 1)
			Local $posY = $minY + (($maxY - $minY) * $i) / ($slotsPerEdge - 1)
			If int($posY) < 566 Then Click(Int($posX),Int($posY), $nbtroopPerSlot,0,"#0108")

			Endif
			If _Sleep(SetSleep(0)) Then Return
			If $edge2 <> -1 Then ; for 2, 3 and 4 sides attack use 2x dropping
			if $FourFingers = 5 then ; if $nbSide = 5
				Local $posX2 = $maxX2 - (($maxX2 - $minX2) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				Local $posY2 = $maxY2 - (($maxY2 - $minY2) * ($slotsPerEdge-$i)) / ($slotsPerEdge - 1)
				If Int($posY2) < 566 Then Click(Int($posX2),Int($posY2), 1,0,"#0109")

				;Setlog("X = " & $posX2 & " Y = " & $posY2)
				Local $posX2 = $maxX2TR - (($maxX2TR - $minX2TR) * $i) / ($slotsPerEdge - 1);addition
			    Local $posY2= $maxY2TR - (($maxY2TR - $minY2TR) * $i) / ($slotsPerEdge - 1);addition
				If Int($posY2) < 566 Then Click(Int($posX2),Int($posY2), 1,0,"#0109")

			Else
				Local $posX2 = $maxX2 - (($maxX2 - $minX2) * $i) / ($slotsPerEdge - 1)
				Local $posY2 = $maxY2 - (($maxY2 - $minY2) * $i) / ($slotsPerEdge - 1)
				;If $x = 0 Then
				;   ; add delay for first wave attack to prevent skip dropping troops, must add for 4 sides attack
				;EndIf
				If Int($posY2) < 566 Then Click(Int($posX2),Int($posY2), $nbtroopPerSlot,0,"#0109")

			Endif
				$nbTroopsLeft -= $nbtroopPerSlot
			Else
				$nbTroopsLeft -= $nbtroopPerSlot
			EndIf
			If $FourFingers = 5 then ; if $nbSide = 5

			If $SpeedThrottle > 0 then

			if _Sleep($SpeedThrottle) then return
			$SpeedThrottle = $SpeedThrottle - ($i * 3)
			Endif

			Else

			If GUICtrlRead($cmbDBUnitDelay) <> 0 then

            If _Sleep(SetSleep(0)) Then Return

			Endif

			Endif

		Next
		If _Sleep(SetSleep(0)) Then Return
		If $FourFingers = 5 then ; if $nbSide = 5 effect for return drop troop when reach edge

		$slotsPerEdge = Ceiling($number * 0.3)

		For $i =0 to $slotsPerEdge -1

				Local $posX = $minX + (($maxX - $minX) * $i) / ($number - 1)
				Local $posY = $minY + (($maxY - $minY) * $i) / ($number - 1)
				;Setlog("Reversed : X = " & $posX & " Y = " & $posY)
				If Int($posY) < 566 Then Click(Int($posX),Int($posY), 1,0,"#0108")
				Local $posX = $minXTL + (($maxXTL - $minXTL) * ($number-$i)) / ($number - 1);addition
				Local $posY = $minYTL + (($maxYTL - $minYTL) * ($number-$i)) / ($number - 1);addition
				If Int($posY) < 566 Then Click(Int($posX),Int($posY), 1,0,"#0108") ;addition


				If $edge2 <> -1 Then ; for 2, 3 and 4 sides attack use 2x dropping

				Local $posX2 = $maxX2 - (($maxX2 - $minX2) * $i) / ($number - 1)
				Local $posY2 = $maxY2 - (($maxY2 - $minY2) * $i) / ($number - 1)
				If Int($posY2) < 566 Then Click(Int($posX2),Int($posY2), 1,0,"#0109")

				;Setlog("Reversed : X = " & $posX2 & " Y = " & $posY2)

				Local $posX2 = $maxX2TR - (($maxX2TR - $minX2TR) * ($number-$i)) / ($number - 1);addition
			    Local $posY2= $maxY2TR - (($maxY2TR - $minY2TR) * ($number-$i)) / ($number - 1);addition
				If Int($posY2) < 566 Then Click(Int($posX2),Int($posY2), 1,0,"#0109")

			    Endif

		Next

		Endif
        If _Sleep(SetSleep(0)) Then Return
	EndIf
EndFunc   ;==>DropOnEdgeFourFingers