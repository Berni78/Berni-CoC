; PB6 TH Snipe Attack Script by mojacka

Func AttackTHPB6()
	; $eBarb, $eArch, $eGiant, $eGobl, $eWall, $eBall, $eWiza, $eHeal, $eDrag, $ePekk, $eMini, $eHogs, $eValk, $eGole, $eWitc, $eLava
	; $eKing, $eQueen, $eCastle, $eLSpell, $eHSpell, $eRSpell, $eJSpell, $eFSpell, $ePSpell, $eESpell, $eHaSpell
	;  AttackTHGrid($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)
	$spotsNum = 5;

	Setlog("Free meal")
	AttackTHGrid($eArch, $spotsNum, 1, 1000, 1, 2, 0)
	AttackTHGrid($eArch, $spotsNum, Random(2, 3, 1), 500, 2, 2, 0)
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHPB61) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("Fool me once shame on you, fool me twice shame on me")
	AttackTHGrid($eBarb, $spotsNum, 1, 1000, 1, 2, 0)
	AttackTHGrid($eBarb, $spotsNum, Random(2, 3, 1), 500, 2, 2, 0)
	AttackTHGrid($eGobl, $spotsNum, Random(2, 3, 1), 500, 1, 1, 0) ; time to drop goblins if there are some mainly for distraction and some loot
	AttackTHGrid($eArch, $spotsNum, Random(2, 3, 1), 500, 1, 1, 0)
	AttackTHGrid($eMini, $spotsNum, Random(2, 3, 1), 500, 1, 1, 0)
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHPB61) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("Now I am really angry!") ;Send in the Defense specialists - Giants, Ballons and Hogriders
	AttackTHGrid($eGiant, 1, 1, 1000, 1, 2, 0)
	AttackTHGrid($eGiant, 1, Random(8, 10, 1), 500, 2, 2, 0)
	AttackTHGrid($eBarb, $spotsNum, Random(2, 3, 1), 500, 2, 2, 0)

	AttackTHGrid($eBall, $spotsNum, Random(1, 2, 1), 500, 1, 1, 0)
	AttackTHGrid($eHogs, 1, Random(8, 10, 1), 500, 1, 1, 0)

	AttackTHGrid($eWall, 2, Random(3, 5, 1), 500, 1, 1, 0)
	AttackTHGrid($eArch, $spotsNum, Random(2, 3, 1), 500, 1, 1, 0)
	AttackTHGrid($eWiza, $spotsNum, Random(1, 2, 1), 500, 1, 1, 0)
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHPB61) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("ALL IN!!!") ;Desperate times need desperate measures
	AttackTHGrid($eGole, 1, Random(1, 3, 1), 1500, 1, 1, 0)
	AttackTHGrid($eDrag, 1, Random(1, 3, 1), 500, 1, 1, 0)
	AttackTHGrid($ePekk, 1, Random(1, 3, 1), 500, 1, 1, 0)
	AttackTHGrid($eValk, 1, Random(1, 3, 1), 500, 1, 1, 0)

	AttackTHGrid($eGiant, 1, Random(8, 10, 1), 500, 2, 2, 0)
	AttackTHGrid($eWiza, $spotsNum, Random(1, 2, 1), 500, 1, 1, 0)

	LaunchTroop2($listInfoDeploy, $CC, $King, $Queen)

	AttackTHGrid($eWitc, 1, Random(1, 3, 1), 500, 1, 1, 0)
	AttackTHGrid($eHeal, 1, Random(1, 3, 1), 500, 1, 1, 0)

	If _Sleep($iDelayalgorithm_AllTroops4) Then Return
	SetLog("Dropping left over troops", $COLOR_BLUE)
	For $x = 0 To 1
		PrepareAttack($iMatchMode, True) ;Check remaining quantities
		For $i = $eBarb To $eLava ; lauch all remaining troops
			;If $i = $eBarb Or $i = $eArch Then
			LauchTroop($i, $nbSides, 0, 1)
			CheckHeroesHealth()
			;Else
			;	 LauchTroop($i, $nbSides, 0, 1, 2)
			;EndIf
			If _Sleep($iDelayalgorithm_AllTroops5) Then Return
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

EndFunc   ;==>AttackTHPB6