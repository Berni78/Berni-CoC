; #FUNCTION# ====================================================================================================================
; Name ..........: algorithmTH
; Description ...: This file contens the attack algorithm TH and Lspell
; Syntax ........: algorithmTH() , AttackTHGrid() , AttackTHNormal() , AttackTHXtreme() , LLDropheroes() , SpellTHGrid() , CastSpell()
; Parameters ....: None
; Return values .: None
; Author ........: AtoZ (2015)
; Modified ......: Barracoda (July 2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Func algorithmTH() ;Attack Algorithm TH
	If $iMatchMode = $TS Or $chkATH = 1 And GUICtrlRead($BottomTHType) Then ; $iMatchMode = $TS
		$LeftTHx = 40
		$RightTHx = 30
		$BottomTHy = 30
		$TopTHy = 30
		$GetTHLoc = 0
		If $THLocation = 0 Then
			SetLog("Can't get Townhall location", $COLOR_RED)
		ElseIf $THx > 227 And $THx < 627 And $THy > 151 And $THy < 419 And ($iMatchMode = $TS Or $chkATH = 1) Then ;if found outside
			SetLog("Townhall location (" & $THx & ", " & $THy & ")")
			SetLog("Townhall is in the Center of the Base. Ignore Attacking Townhall", $COLOR_RED)
			$THLocation = 0
		Else
			SetLog("Townhall location (" & $THx & ", " & $THy & ")")
		EndIf
		If _Sleep($iDelayAlgorithmTH1) Then Return
		While 1
			Local $i = 0
			If $Barb <> -1 And $THLocation <> 0 Then
				$atkTroops[$Barb][1] = Number(ReadTroopQuantity($Barb))
				Local $numBarbPerSpot = Ceiling($atkTroops[$Barb][1] / 3)
				If $atkTroops[$Barb][1] <> 0 Then
					Click(GetXPosOfArmySlot($Barb, 68), 595, 1, 0, "#0001") ;Select Troop
					If _Sleep($iDelayAlgorithmTH1) Then ExitLoop (2)
					If $iMatchMode = $TS Or $chkATH = 1 Then
						If $GetTHLoc = 0 Then
							If $THx < 287 And $THx > 584 And $THy < 465 Then ; Leftmost, Rightmost, Topmost. If found Outside
								$i = 0
								$atkTroops[$Barb][1] = Number(ReadTroopQuantity($Barb))
								While $atkTroops[$Barb][1] <> 0
									Click(($THx - $LeftTHx), ($THy + $LeftTHx - 30), 1, 1, "#0002") ; BottomLeft
									$AtkTroopTH = Number(ReadTroopQuantity($Barb))
									SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
									$LeftTHx += 10
									$i += 1
									If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
										$GetTHLoc += 1
										ExitLoop
									EndIf
								WEnd
								$i = 0
								$atkTroops[$Barb][1] = Number(ReadTroopQuantity($Barb))
								While $atkTroops[$Barb][1] <> 0
									Click(($THx + $RightTHx), ($THy + $RightTHx - 10), 1, 1, "#0003") ; BottomRight
									$AtkTroopTH = Number(ReadTroopQuantity($Barb))
									SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
									$RightTHx += 10
									$i += 1
									If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
										$GetTHLoc += 1
										ExitLoop
									EndIf
								WEnd
							EndIf
							$i = 0
							$atkTroops[$Barb][1] = Number(ReadTroopQuantity($Barb))
							While $atkTroops[$Barb][1] <> 0
								Click(($THx + $TopTHy - 10), ($THy - $TopTHy), 1, 1, "#0004") ; TopRight
								$AtkTroopTH = Number(ReadTroopQuantity($Barb))
								SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
								$TopTHy += 10
								$i += 1
								If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
									$GetTHLoc += 1
									ExitLoop
								EndIf
							WEnd
							$i = 0
							$atkTroops[$Barb][1] = Number(ReadTroopQuantity($Barb))
							While $atkTroops[$Barb][1] <> 0
								Click(($THx - ($BottomTHy + 10)), ($THy - $BottomTHy), 1, 1, "#0005") ; TopLeft
								$AtkTroopTH = Number(ReadTroopQuantity($Barb))
								SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
								$BottomTHy += 10
								$i += 1
								If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 10 Then
									$GetTHLoc += 1
									ExitLoop
								EndIf
							WEnd
						EndIf
						SetLog("Attacking Townhall with first wave Barbarians", $COLOR_BLUE)
						For $i = 2 To 4
							If $GetTHLoc = $i Then $numBarbPerSpot = Ceiling($numBarbPerSpot / $i)
						Next
						If $THx < 287 And $THx > 584 And $THy < 465 Then ;Leftmost, rightmost, topmost. If found outside
							Click(($THx - $LeftTHx), ($THy + $LeftTHx - 30), $numBarbPerSpot, $iDelayAlgorithmTH3, "#0006") ; BottomLeft
							Click(($THx + $RightTHx), ($THy + $RightTHx - 10), $numBarbPerSpot, $iDelayAlgorithmTH3, "#0007") ; BottomRight
						EndIf
						Click(($THx + $TopTHy - 10), ($THy - $TopTHy), $numBarbPerSpot, $iDelayAlgorithmTH3, "#0008") ; TopRight
						Click(($THx - ($BottomTHy + 10)), ($THy - $BottomTHy), $numBarbPerSpot, $iDelayAlgorithmTH3, "#0009") ; TopLeft
					EndIf
				EndIf
				If _Sleep($iDelayAlgorithmTH2) Then ExitLoop
			EndIf
			If $Arch <> -1 And $THLocation <> 0 Then
				$atkTroops[$Arch][1] = Number(ReadTroopQuantity($Arch))
				Local $numArchPerSpot = Ceiling($atkTroops[$Arch][1] / 3)
				If $atkTroops[$Arch][1] <> 0 Then
					Click(GetXPosOfArmySlot($Arch, 68), 595, 1, 0, "#0010") ;Select Troop
					If _Sleep($iDelayAlgorithmTH1) Then ExitLoop (2)
					If $iMatchMode = $TS Or $chkATH = 1 Then
						If $GetTHLoc = 0 Then
							If $THx < 287 And $THx > 584 And $THy < 465 Then ; Leftmost, Rightmost and Topmost. If found outside
								$i = 0
								$atkTroops[$Arch][1] = Number(ReadTroopQuantity($Arch))
								While $atkTroops[$Arch][1] <> 0
									Click(($THx - $LeftTHx), ($THy + $LeftTHx - 30), 1, 1, "#0011") ; BottomLeft
									$AtkTroopTH = Number(ReadTroopQuantity($Arch))
									SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
									$LeftTHx += 10
									$i += 1
									If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
										$GetTHLoc += 1
										ExitLoop
									EndIf
								WEnd
								$i = 0
								$atkTroops[$Arch][1] = Number(ReadTroopQuantity($Arch))
								While $atkTroops[$Arch][1] <> 0
									Click(($THx + $RightTHx), ($THy + $RightTHx - 10), 1, 1, "#0012") ; BottomRight
									$AtkTroopTH = Number(ReadTroopQuantity($Arch))
									SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
									$RightTHx += 10
									$i += 1
									If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
										$GetTHLoc += 1
										ExitLoop
									EndIf
								WEnd
							EndIf
							$i = 0
							$atkTroops[$Arch][1] = Number(ReadTroopQuantity($Arch))
							While $atkTroops[$Arch][1] <> 0
								Click(($THx + $TopTHy - 10), ($THy - $TopTHy), 1, 1, "#0013") ; TopRight
								$AtkTroopTH = Number(ReadTroopQuantity($Arch))
								SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
								$TopTHy += 10
								$i += 1
								If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
									$GetTHLoc += 1
									ExitLoop
								EndIf
							WEnd
							$i = 0
							$atkTroops[$Arch][1] = Number(ReadTroopQuantity($Arch))
							While $atkTroops[$Arch][1] <> 0
								Click(($THx - ($BottomTHy + 10)), ($THy - $BottomTHy), 1, 1, "#0014") ; TopLeft
								$AtkTroopTH = Number(ReadTroopQuantity($Arch))
								SetLog("Getting Attack Townhall location...", $COLOR_BLUE)
								$BottomTHy += 10
								$i += 1
								If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 10 Then
									$GetTHLoc += 1
									ExitLoop
								EndIf
							WEnd
						EndIf
						SetLog("Attacking Townhall with first wave of Archers", $COLOR_BLUE)
						$LeftTHx += 10
						$RightTHx += 10
						$BottomTHy += 10
						$TopTHy += 10
						For $i = 2 To 4
							If $GetTHLoc = $i Then $numArchPerSpot = Ceiling($numArchPerSpot / $i)
						Next
						If $THx < 287 And $THx > 584 And $THy < 465 Then ;Left most and Right most and tOp most. if found outside
							Click(($THx - $LeftTHx), ($THy + $LeftTHx - 30), $numArchPerSpot, $iDelayAlgorithmTH3, "#0015") ; BottomLeft
							Click(($THx + $RightTHx), ($THy + $RightTHx - 10), $numArchPerSpot, $iDelayAlgorithmTH3, "#0016") ; BottomRight
						EndIf
						Click(($THx + $TopTHy - 10), ($THy - $TopTHy), $numArchPerSpot, $iDelayAlgorithmTH3, "#0017") ; TopRight
						Click(($THx - ($BottomTHy + 10)), ($THy - $BottomTHy), $numArchPerSpot, $iDelayAlgorithmTH3, "#0018") ; TopLeft
					EndIf
				EndIf
			EndIf
			ExitLoop
		WEnd
		If $THLocation <> 0 Then
			PrepareAttack($iMatchMode, True) ;Check remaining quantities
		EndIf
	EndIf
EndFunc   ;==>algorithmTH

Func AttackTHGrid($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)
	Local $aThx, $aThy, $num
	Local $TroopCountBeg
	If $iMatchMode = $TS Or $chkATH = 1 And SearchTownHallLoc() Then

		;_CaptureRegion()
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

		;_CaptureRegion()
		$TroopCountBeg = Number(ReadTroopQuantity($THtroop))

		If ($THtroop = -1) Or ($TroopCountBeg = 0) Then SetLog("No " & $name & " troop Found!!!")
		If ($THtroop = -1) Or ($TroopCountBeg = 0) Then Return False

		Local $waveName = "first"
		If $waveNb = 2 Then $waveName = "second"
		If $waveNb = 3 Then $waveName = "third"
		If $maxWaveNb = 1 Then $waveName = "only"
		If $waveNb = 0 Then $waveName = "last"
		SetLog("Dropping " & $waveName & " wave of " & $troopNb & " " & $name, $COLOR_GREEN)

		;			SetLog("Attacking TH with "&NameOfTroop($atkTroops[$THtroop][0]))
		SelectDropTroop($THtroop) ;Select Troop
		If _Sleep($iDelayAttackTHGrid1) Then Return

		If $THi <= 15 Or $THside = 0 Or $THside = 2 Then
			Switch $THside
				Case 0 ;UL
					For $num = 0 To $numperspot - 1
						For $ii = $THi - 1 To $THi - 1 + ($spots - 1)
							$aThx = 25 + $ii * 19
							$aThy = 314 - $ii * 14
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0019")
							If _Sleep(Random($iDelayAttackTHGrid2min, $iDelayAttackTHGrid2max)) Then Return
						Next
						If _Sleep(Random($iDelayAttackTHGrid3min, $iDelayAttackTHGrid3max)) Then Return
					Next
				Case 1 ;LL
					For $num = 0 To $numperspot - 1
						For $ii = $THi To $THi + ($spots - 1)
							$aThx = 25 + $ii * 19
							$aThy = 314 + $ii * 14
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0020")
							If _Sleep(Random($iDelayAttackTHGrid2min, $iDelayAttackTHGrid2max)) Then Return
						Next
						If _Sleep(Random($iDelayAttackTHGrid3min, $iDelayAttackTHGrid3max)) Then Return
					Next
				Case 2 ;UR
					For $num = 0 To $numperspot - 1
						For $ii = $THi To $THi + ($spots - 1)
							$aThx = 830 - $ii * 19
							$aThy = 314 - $ii * 14
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0021")
							If _Sleep(Random($iDelayAttackTHGrid2min, $iDelayAttackTHGrid2max)) Then Return
						Next
						If _Sleep(Random($iDelayAttackTHGrid3min, $iDelayAttackTHGrid3max)) Then Return
					Next
				Case 3 ;LR
					For $num = 0 To $numperspot - 1
						For $ii = $THi + 1 To $THi + 1 + ($spots - 1)
							$aThx = 830 - $ii * 19
							$aThy = 314 + $ii * 14
							Click(Random($aThx - 5, $aThx + 5, 1), Random($aThy - 5, $aThy + 5, 1), 1, 0, "#0022")
							If _Sleep(Random($iDelayAttackTHGrid2min, $iDelayAttackTHGrid2max)) Then Return
						Next
						If _Sleep(Random($iDelayAttackTHGrid3min, $iDelayAttackTHGrid3max)) Then Return
					Next
			EndSwitch
		EndIf
#cs		If $THi > 15 Then
			If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
				;Zoom in all the way
				SetLog("Zooming in...")
				While $zCount < 6
					If _Sleep($iDelayAttackTHGrid4) Then Return
					ControlSend($Title, "", "", "{UP}")
					If _Sleep($iDelayAttackTHGrid5) Then Return
					$zCount += 1
				WEnd
				SetLog("Done zooming.")
				If _Sleep($iDelayAttackTHGrid6) Then Return

				;Scroll to bottom
				SetLog("Scrolling to bottom...")
				While $sCount < 7
					If _Sleep($iDelayAttackTHGrid4) Then Return
					ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
					If _Sleep($iDelayAttackTHGrid5) Then Return
					$sCount += 1
				WEnd
				$zoomedin = True
			EndIf
			If $THside = 1 Then
				;						Setlog("LL Bottom deployment $THi="&$THi)
				For $num = 0 To $numperspot - 1
					For $ii = $THi + 1 To $THi + 1 + ($spots - 1)
						$aThx = 830 - $ii * 19
						$aThy = 314 + $ii * 14
						Click(730, 450, 1 , 0, "#0341")
						If _Sleep(Random($iDelayAttackTHGrid2min, $iDelayAttackTHGrid2max)) Then Return
					Next
					If _Sleep(Random($iDelayAttackTHGrid3min, $iDelayAttackTHGrid3max)) Then Return
				Next
#ce			EndIf
			If $THside = 3 Then
				;						Setlog("LR Bottom deployment $THi="&$THi)
				For $num = 0 To $numperspot - 1
					For $ii = $THi + 1 To $THi + 1 + ($spots - 1)
						$aThx = 830 - $ii * 19
						$aThy = 314 + $ii * 14
						;Click($aThx,$aThy)
						Click(730, 450, 1, 0, "#0342")
						If _Sleep(Random($iDelayAttackTHGrid2min, $iDelayAttackTHGrid2max)) Then Return
					Next
					If _Sleep(Random($iDelayAttackTHGrid3min, $iDelayAttackTHGrid3max)) Then Return
				Next
			EndIf
;		EndIf

		If $THi>15 And ($THside = 1 Or $THside = 3) Then
			 Switch $BottomTHType
				Case 1
				AllZoomedAttack($num,$numperspot,$spots)
				Case 2
				ModrateZoom($num,$numperspot,$spots)
				Case 3
                SideSnipe($num,$numperspot,$spots)
			 EndSwitch
			EndIf

		If _Sleep($iDelayAttackTHGrid1) Then Return
		;_CaptureRegion()
		;			Setlog($TroopCountBeg&" = "&Number(ReadTroopQuantity($THtroop))))
		If $TroopCountBeg <> Number(ReadTroopQuantity($THtroop)) Then
			SetLog("Deployment of " & $name & " Successful!")
			If _Sleep($Sleep) Then Return
		Else
			SetLog("Deployment of " & $name & "NOT Successful!")
		EndIf

        If $BoolDropHeroes = True Then ALLDropheroes($aThx, $aThy)

	EndIf

EndFunc   ;==>AttackTHGrid

Func AttackTHNormal()
   If $OptTrophyMode = 1 Then
	If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
	Setlog("Normal Attacking TH Outside with BAM PULSE!")

	;---1st wave
	AttackTHGrid($eBarb, 3, 2, 1800, 1, 5, 0) ; deploys 6 barbarians
	AttackTHGrid($eArch, 3, 2, 1200, 1, 4, 0) ; deploys 6 archers
	AttackTHGrid($eMini, 3, 2, 1000, 1, 4, 0) ; deploys 6 minions
	$count = 0
	While $count < 30
		If _Sleep($iDelayAttackTHNormal1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	;---2nd wave
	AttackTHGrid($eBarb, 3, 2, 1500, 2, 5, 0) ; deploys 6 barbarians
	AttackTHGrid($eArch, 3, 2, 1400, 2, 4, 0) ; deploys 6 archers
	AttackTHGrid($eMini, 3, 2, 1300, 2, 4, 0) ; deploys 6 minions
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHNormal1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	;---3rd wave 10 secs
	AttackTHGrid($eBarb, 3, 2, 1400, 3, 5, 0) ; deploys 6 barbarians
	AttackTHGrid($eMini, 3, 2, 1300, 3, 4, 0) ; deploys 6 minions
	AttackTHGrid($eArch, 3, 2, 1200, 3, 4, 0) ; deploys 6 archers
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHNormal1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("Normal Attacking TH Outside in FULL!")
	AttackTHGrid($eGiant, 3, 1, 1000, 1, 2, 0) ;releases 3 giants
	AttackTHGrid($eWall, 2, 2, 1100, 1, 1, 0) ; deploys 4 wallbreakers
	AttackTHGrid($eArch, 5, 5, 1200, 4, 4, 0) ;releases 25 archers
	AttackTHGrid($eBarb, 5, 5, 1150, 4, 5, 0) ;releases 25 barbs
	AttackTHGrid($eMini, 5, 2, 1000, 4, 4, 1) ;releases 10 minions and Heroes
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHNormal1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	;Final Wave
	AttackTHGrid($eGiant, 5, 1, 1100, 2, 2, 0) ;releases 5 giants
	AttackTHGrid($eHogs, 5, 1, 1300, 2, 4, 0) ;releases 5 Hogs
	AttackTHGrid($eArch, 5, 5, 1000, 4, 4, 0) ;releases 25 archers
	AttackTHGrid($eBarb, 5, 5, 1100, 4, 5, 0) ;releases 25 barbs
	AttackTHGrid($eMini, 5, 2, 1050, 4, 4, 0) ;releases 10 minions
	AttackTHGrid($eWiza, 3, 2, 1000, 1, 1, 1) ;releases 6 wizards and releases hero
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHNormal1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

EndFunc   ;==>AttackTHNormal

Func AttackTHXtreme()
	If $OptTrophyMode = 1 Then
	If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
	Setlog("Extreme Attacking TH Outside with BAM PULSE!")

	;---1st wave 15 secs
	;		SetLog("Attacking TH with 1st wave of BAM COMBO")
	AttackTHGrid($eBarb, 5, 1, 1000, 1, 5, 0) ; deploys 5 barbarians
	AttackTHGrid($eArch, 5, 1, 1000, 1, 4, 0) ; deploys 5 archers
	AttackTHGrid($eMini, 5, 1, 1000, 1, 4, 0) ; deploys 5 minions
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHXtreme1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	;---2nd wave 20 secs
	;		 SetLog("Attacking TH with 2nd wave of BAM COMBO")
	AttackTHGrid($eBarb, 5, 1, 1000, 2, 5, 0) ; deploys 5 barbarians
	AttackTHGrid($eMini, 5, 1, 1000, 2, 4, 0) ; deploys 5 minions
	AttackTHGrid($eArch, 5, 1, 1000, 2, 4, 0) ; deploys 5 archers
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHXtreme1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	;---3nd wave 10 secs
	;		 SetLog("Attacking TH with 3rd wave of BAM COMBO")
	AttackTHGrid($eBarb, 5, 1, 1000, 3, 5, 0) ; deploys 5 barbarians
	AttackTHGrid($eMini, 5, 1, 1000, 3, 4, 0) ; deploys 5 minions
	AttackTHGrid($eArch, 5, 1, 1200, 3, 4, 0) ; deploys 5 archers
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHXtreme1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	;---4th wave
	Setlog("Extreme Attacking TH Outside in FULL!")
	AttackTHGrid($eGiant, 3, 1, 1000, 1, 4, 0) ;releases 3 giants
	AttackTHGrid($eWall, 2, 2, 100, 1, 1, 0) ; deploys 4 wallbreakers
	AttackTHGrid($eArch, 5, 5, 1200, 4, 4, 0) ;releases 25 archers
	AttackTHGrid($eBarb, 5, 5, 1200, 4, 5, 0) ;releases 25 barbs
	AttackTHGrid($eMini, 5, 2, 1200, 4, 4, 0) ; deploys 5 minions
	AttackTHGrid($eGiant, 5, 1, 1000, 2, 4, 0) ;releases 5 giants
	AttackTHGrid($eHogs, 5, 1, 1000, 2, 4, 0) ;releases 5 Hogs
	AttackTHGrid($eBarb, 5, 5, 1200, 5, 5, 0) ;releases 25 barbs
	AttackTHGrid($eWiza, 3, 2, 1000, 1, 1, 1) ;releases 6 wizards and releases hero
	$count = 0
	While $count < 20
		If _Sleep($iDelayAttackTHXtreme1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

EndFunc   ;==>AttackTHXtreme

Func AttackTHGbarch()
	If $OptTrophyMode = 1 Then
	If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
	Setlog("Sending 1st wave of archers and Barbarians.")
	AttackTHGrid($eArch, 5, 2, 2000, 1, 4, 0) ; deploys 10 archers - take out possible bombs
	AttackTHGrid($eBarb, 2, Random(4, 5, 1), 1000, 1, 4, 0) ; deploys 8-10 archers
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHGbarch1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("Sending second wave of archers And Barbarians.")
	AttackTHGrid($eArch, 4, Random(4, 5, 1), 1000, 2, 4, 0) ;deploys 16-20 archers
	AttackTHGrid($eBarb, 4, Random(4, 5, 1), 1500, 1, 5, 0) ; deploys 16-20 barbarians
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHGbarch1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("Still no star - Let's send in more diverse troops!")
	AttackTHGrid($eGiant, 2, 1, 1240, 1, 2, 0) ;deploys 2 giants in case of spring traps
	AttackTHGrid($eGiant, 2, Random(3, 4, 1), 1500, 2, 2, 0) ;deploys 6-8 giants to take heat
	AttackTHGrid($eBarb, 3, Random(4, 5, 1), 1000, 1, 5, 0) ; deploys up to 12-15 barbarians
	AttackTHGrid($eBarb, 4, Random(4, 5, 1), 1500, 1, 5, 0) ; deploys up to 16-20 barbarians
	AttackTHGrid($eArch, 3, 8, 1200, 3, 4, 0) ; deploys 24 archers
	AttackTHGrid($eArch, 4, 7, 1000, 3, 4, 0) ; deploys 28 archers
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHGbarch1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd

	Setlog("Hope the rest of your troops can finish the job!")
	AttackTHGrid($eGiant, 2, 9, 1500, 3, 2, 1) ;deploys CC/Heroes & up to 18 giants (in case numbers are off)
	AttackTHGrid($eBarb, 4, 8, 1200, 2, 5, 0) ; deploys up to 32 barbarians
	AttackTHGrid($eArch, 3, 13, 1210, 4, 4, 0) ;deploys up to 39 archers
	AttackTHGrid($eBarb, 3, 11, 1190, 2, 5, 0) ; deploys up to 33 barbarians
	AttackTHGrid($eArch, 2, 20, 1200, 4, 4, 0) ;deploys up to 40 archers
	AttackTHGrid($eBarb, 4, 9, 1500, 2, 5, 0) ; deploys up to 36 barbarians
	AttackTHGrid($eArch, 2, 20, 1000, 4, 4, 0) ;deploys up to 40 archers
	$count = 0
	While $count < 25
		If _Sleep($iDelayAttackTHGbarch1) Then Return
		;_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aWonOneStar[0], $aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
			SetLog("Townhall has been destroyed!")
			Return ;exit if you get a star
		EndIf
		$count += 1
	WEnd
	SetLog("All Giants, Barbs, and Archers should be deployed, in addition to Heroes & CC (if options are selected). Other troops are not meant to be deployed in this algorithm.", $COLOR_GREEN)

EndFunc   ;==>AttackTHGbarch

Func AttackTHWizard()
        If $OptTrophyMode = 1 Then
	     If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
     SetLog($thinfo)
	 SetLog("Sending 2-6 Wizards.")
     AttackTHGrid($eWiza,2,1,1000,1,1,1) ; deploy 2 Wizards - for Taking Down All Traps
	 AttackTHGrid($eWiza,2,Random(2,4,1),1000,2,3,0) ; deploy 4-6 Wizards
	 $count = 0
	 While $count < 20
	 If _Sleep($iDelayAttackTHWizard1) Then Return
;	  _CaptureRegion()
	  If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
	    SetLog("Townhall has been destroyed!")
	  Return ;exit if you get a star
    EndIf
 $count+=1
WEnd

	 Setlog("Get 1 Star ? Sending Some 10 More Wizards.")
	 AttackTHGrid($eWiza,4,Random(1,3,1),1000,2,3,0) ; deploy 4 Wizards
	  AttackTHGrid($eWiza,4,Random(1,4,1),1000,2,3,0) ; deploy 4 Wizards
	  $count = 0
   While $count < 20
    If _Sleep($iDelayAttackTHWizard1) Then Return
;   _CaptureRegion()
   If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
	SetLog("Townhall has been destroyed!")
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd

	 Setlog("Still Cant Get 1 Star ? Sending Again 16 More Wizards.")
	 AttackTHGrid($eWiza,4,Random(2,3,1),1000,2,3,0) ; deploy 8-12 Wizards
	  AttackTHGrid($eWiza,4,Random(3,4,1),1000,2,3,0) ; deploy 12-16 Wizards
	  $count = 0
   While $count < 20
    If _Sleep($iDelayAttackTHWizard1) Then Return
;   _CaptureRegion()
   If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
	SetLog("Townhall has been destroyed!")
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd

    Setlog("Now i know i Need to Send All My Wizards."
	AttackTHGrid($eWiza,4,4,1500,2,3,0) ; release Heroes/CC + 16 Wizards
	AttackTHGrid($eWiza,3,4,1000,2,3,0) ; release 12 Wizards
	AttackTHGrid($eWiza,5,4,1000,2,3,0) ; release 20 Wizards
	$count = 0
  While $count < 20
	  If _Sleep($iDelayAttackTHWizard1) Then Return
;     _CaptureRegion()
	  If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
	   SetLog("Townhall has been destroyed!")
	   Return ;exit if you get a star
    EndIf
    $count+=1
  WEnd
     SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)
EndFunc ;----AttackTHWizards

Func AttackTHDragon()
If $OptTrophyMode = 1 Then
	If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
SetLog($thinfo)
Setlog("Sending some troops.")
AttackTHGrid($eDrag,1,1,500,1,1,0) ;releases 1 dragons

$count = 0
While $count < 25
 If _Sleep($iDelayAttackTHDragon1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd

Setlog("No star yet? More troops needed.")
AttackTHGrid($eDrag,1,1,500,1,1,0) ;releases 1 dragons
$count = 0
While $count < 25
If _Sleep($iDelayAttackTHDragon1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd

Setlog("No star yet? Even more trops.")
AttackTHGrid($eDrag,3,1,500,1,1,0) ;releases 2 dragons
$count = 0
While $count < 25
If _Sleep($iDelayAttackTHDragon1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd

Setlog("I smell a trap! Let's send more troops...")
;AttackTHGrid($eDrag,3,1,500,1,1,0) ;releases 2 dragons
AttackTHGrid($eDrag,1,1,500,1,1,0) ;releases 1 dragons
AttackTHGrid($eDrag,1,1,500,1,1,1) ;releases 1 dragons and releases hero
$count = 0
While $count < 25
If _Sleep($iDelayAttackTHDragon1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd

Setlog("Definetly a trap!")
AttackTHGrid($eDrag,3,1,500,1,1,0) ;releases 2 dragons

$count = 0
While $count < 25
If _Sleep($iDelayAttackTHDragon1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd

Setlog("Ok, this is getting serious, saved the best for last!")
AttackTHGrid($eDrag,3,1,500,1,1,0) ;releases 3 dragons

$count = 0
While $count < 25
If _Sleep($iDelayAttackTHDragon1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd
SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)
EndFunc ;===>AttackTHDragons

Func AttackTHSmartBarch()
          If $OptTrophyMode = 1 Then
	      If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
		 SetLog($thinfo)
   		 Setlog("Sniping TH with SmartBarch")

		 ; 1st wave 30 secs, total 4 barbs 8 archers, works for totally unprotected TH
		 SetLog("Attacking TH with 1st wave of BARCH", $COLOR_BLUE)
		 AttackTHGrid($eBarb,4,1,2000,1,4,0) ; deploys 4 barbarians to take out traps waits 2 seconds for bombs to go off
		 AttackTHGrid($eArch,2,4,28000,1,4,0) ; deploys 8 archers and wait additional 28sec
		 If _Sleep($iDelayAttackTHSmartBarch1) Then Return
;		 _CaptureRegion()
		 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
		 SetLog("Easy 1 star! Yay!", $COLOR_RED)
		 _Sleep(1000)
		 Return ; exit if you get a star
		 EndIf
		 ; 2nd wave 25 secs total 16 barbs, 22 archers, works for TH partially covered by defenses
 		 SetLog("Attacking TH with 2nd wave of BARCH", $COLOR_BLUE)
		 AttackTHGrid($eBarb,4,2,200,2,4,0) ; deploys 8 barbarians
		 AttackTHGrid($eArch,2,5,2000,2,4,0) ; deploys 10 archers and waits 2 seconds
		 AttackTHGrid($eBarb,4,2,200,2,4,0) ; deploys 8 barbarians
		 AttackTHGrid($eArch,4,3,22000,2,4,0) ; deploys 12 archers and wait additional 22sec
		 If _Sleep($iDelayAttackTHSmartBarch1) Then Return
;		 _CaptureRegion()
		 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
		 SetLog("Cheap 1 star! Yay!", $COLOR_RED)
		 _Sleep(1000)
		 Return ; exit if you get a star
		 EndIf
		 ;---3nd wave 17 secs (rather short interval until ALL IN) total 2 giants, 30 barbs, 57 archers
		 SetLog("Oh Shit! Seems like a trapped TH!", $COLOR_BLUE)
		 AttackTHGrid($eBarb,3,3,200,3,4,0) ; deploys 9 barbarians
		 AttackTHGrid($eGiant,2,1,200,3,4,0) ; deploys 2 giants as meat shield
		 AttackTHGrid($eArch,3,5,200,3,4,0) ; deploys 15 archers
		 AttackTHGrid($eBarb,3,3,200,3,4,0) ; deploys 9 barbarians
		 AttackTHGrid($eArch,3,6,200,3,4,0) ; deploys 18 archers
		 AttackTHGrid($eBarb,4,3,200,3,4,0) ; deploys 12 barbarians
		 AttackTHGrid($eArch,4,6,16000,3,4,0) ; deploys 24 archers and wait additional 16sec
		 If _Sleep($iDelayAttackTHSmartBarch1) Then Return
;		 _CaptureRegion()
		 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
		 SetLog("Phew, got that 1 star!", $COLOR_RED)
		 If _Sleep($iDelayAttackTHSmartBarch1) Then Return
		 Return ; exit if you get a star
		 EndIf
		 ;---4th wave 20 secs throw in everything
		 Setlog("Dammit! ALL IN!", $COLOR_BLUE)
		 AttackTHGrid($eArch,2,10,100,4,4,0) ; deploys 20 archers
		 AttackTHGrid($eBarb,2,10,100,4,4,0) ; deploys 20 barbarians
		 AttackTHGrid($eGiant,3,10,100,4,4,0) ; deploys 30 giants
		 AttackTHGrid($eGobl,2,10,100,4,4,0) ; deploys 20 goblins
		 AttackTHGrid($eWall,2,10,100,4,4,0) ; deploys 20 wallbreakers
		 AttackTHGrid($eWiza,2,10,100,4,4,0) ; deploys 20 wizards
		 AttackTHGrid($eMini,2,10,100,4,4,1) ; deploys 20 minions and Heroes
		 AttackTHGrid($eArch,2,10,100,4,4,1) ; deploys 20 archers and Heroes
		 AttackTHGrid($eBarb,2,10,100,4,4,0) ; deploys 20 barbarians
		 AttackTHGrid($eArch,2,10,100,4,4,0) ; deploys 20 archers
		 AttackTHGrid($eBarb,2,10,100,4,4,0) ; deploys 20 barbarians
		 AttackTHGrid($eArch,4,10,100,4,4,0) ; deploys 40 archers
		 AttackTHGrid($eBarb,4,10,100,4,4,0) ; deploys 40 barbarians
		 AttackTHGrid($eArch,4,10,60000,4,4,1) ; deploys 40 archers and Heroes (again just in case) and waits for a minute

	     SetLog("All troops deployed and waiting for a star...", $COLOR_GREEN)

EndFunc   ;==>AttackTHSmartBarch

Func AttackTHMasterGiBAM()
  If $OptTrophyMode = 1 Then
	If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
 SetLog($thinfo)
 Setlog("Small attack first to get totally unprotected townhall")
	   AttackTHGrid($eArch,3,3,2000,1,4,0) ; deploys 9 archers

 ;check for one star
local $count = 0
While $count < 30
 If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return

 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
	SetLog("Townhall has been destroyed!")
	If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd
;end check for one star

 Setlog(" Not a clear townhall Going In Full Power with GiPAM pulse")
       AttackTHGrid($eGiant,2,1,2500,1,4,0) ; deploys 2 giants as meat shield
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eGole,1,2,1000,2,4,0) ; deploys 2 goelms
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eHogs,5,2,1000,2,4,0) ; deploys 10 hogs
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

       AttackTHGrid($eGiant,5,4,2500,2,4,0) ; deploys 20 giants To Protect PAM pulse
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

       AttackTHGrid($eBarb,5,3,2000,1,4,0) ; deploys 15 barbarians
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eArch,5,4,2000,2,4,0) ; deploys 20 archers

;check for one star
 $count = 0
While $count < 5
 If _Sleep(1000) Then Return

 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
	SetLog("Townhall has been destroyed!")
	If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd
;end check for one star

	   AttackTHGrid($eBarb,6,5,2000,2,4,0) ; deploys 30 barbarians
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eArch,6,10,2000,3,4,0) ; deploys 60 archers
;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

	   AttackTHGrid($eMini,5,2,2000,1,1,1) ; deploys 10 minions with heros


;check for one star
 $count = 0
While $count < 20
 If _Sleep(1000) Then Return

 If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
	SetLog("Townhall has been destroyed!")
	If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
	Return ;exit if you get a star
 EndIf
 $count+=1
WEnd
;end check for one star

 Setlog("Heavily Protected sending in all Remaining Troops")

For $i = $eGole To $eLava ; Deploy Remaining troops
 AttackTHGrid($i,5,2,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

For $i = $eGiant To $eValk ; Deploy Remaining troops
 AttackTHGrid($i,6,5,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

For $i = $eBarb To $eArch ; Deploy Remaining Barb,archers
 AttackTHGrid($i,5,15,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

If _Sleep($iDelayAttackTHMasterGiBAM1) Then Return
 SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

EndFunc    ;===AttackTHMasterGiBAM

Func AttackTrappedTH()
If $OptTrophyMode = 1 Then
	If  $optSpellNone = 1 Then
	       Switch $optSpellType
	       Case 0
		  local $spell = $eLSpell

	       Case 1
		  local $spell = $eHSpell

	      Case 2
		  local $spell = $eRSpell

	       EndSwitch
	      SpellTHGrid($spell)
	   EndIf
	EndIf
SetLog($thinfo)
Setlog("Trapped TH detected.. Let's do this!")
AttackTHGrid($eArch,4,1,2000,1,4,0) ; deploys 4 archers to "reveal" teslas or bombs
AttackTHGrid($eGiant,2,1,850,1,2,0) ;releases 2 giants to trigger spring traps
AttackTHGrid($eGiant,2,2,1200,2,2,0) ;releases 4 giants
AttackTHGrid($eArch,3,8,950,3,4,0) ; deploys 24 archers
AttackTHGrid($eWiza,4,2,1000,2,3,0) ;deploy 8 Wizards
AttackTHGrid($eDrag,1,1,500,1,1,0) ;releases 1 dragons

$count = 0
While $count < 25
If _Sleep($iDelayAttackTrappedTH1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd
SetLog("Still Not DesTroyed The Traps Send More Troop!")
; while giants are distracting, loop through barb/arch until you get a star
AttackTHGrid($eGiant,1,1,1250,2,5,0) ; deploys 1 giant
AttackTHGrid($eWiza,4,2,1000,2,3,0) ;deploy 4 Wizards
AttackTHGrid($eDrag,1,1,500,1,1,0) ;releases 2 dragons
$count = 0
While $count < 20
If _Sleep($iDelayAttackTrappedTH1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd
SetLog("Are u Kidding Me What Kind Of Traps Is That Let Me Do This!")
AttackTHGrid($eBarb,3,4,1020,1,5,0) ; deploys up to 12 barbarians
AttackTHGrid($eWiza,4,2,1000,2,3,0) ;deploy 6 Wizards
AttackTHGrid($eDrag,1,1,500,1,1,0) ;releases 2 dragons
$count = 0
While $count < 15
If _Sleep($iDelayAttackTrappedTH1) Then Return
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd
SetLog("I Hate To Do This But I Need To Destroy All Traps Send More Troops!")
AttackTHGrid($eArch,3,5,650,3,4,0) ; deploys 15 archers
AttackTHGrid($eWiza,4,3,1000,2,3,0) ;deploy 8 Wizards
AttackTHGrid($eDrag,2,1,500,1,1,0) ;releases 3 dragons
If _Sleep($iDelayAttackTrappedTH1) Then Return
$count = 0
While $count < 10
;_CaptureRegion()
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) = True Then
SetLog("Townhall has been destroyed!")
Return ;exit if you get a star
EndIf
$count+=1
WEnd

 Setlog("This TH Is Hard I Need To Sending All Troops")
For $i = $eGole To $eLava ; Deploy Remaining troops
 AttackTHGrid($i,5,2,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTrappedTH1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

For $i = $eGiant To $eValk ; Deploy Remaining troops
 AttackTHGrid($i,6,5,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTrappedTH1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf
;end check for one star

For $i = $eBarb To $eArch ; Deploy Remaining Barb,archers
 AttackTHGrid($i,5,15,2000,0,4,0)
Next

;Check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!")
If _Sleep($iDelayAttackTrappedTH1) Then Return ;wait 1.5 seconds... antiban purpose...
Return ;exit if you get a star
EndIf

SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

EndFunc ;---AttackTrappedTH

Func ALLDropheroes($x, $y)
	dropHeroes($x, $y, $King, $Queen)
	If _Sleep($iDelayALLDropheroes1) Then Return

	dropCC($x, $y, $CC)

	If _Sleep($iDelayALLDropheroes2) Then Return

	;Activate KQ's power
	If $checkKPower Or $checkQPower Then
		SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating King/Queen", $COLOR_ORANGE)
		If _Sleep($delayActivateKQ) Then Return
		If $checkKPower Then
			SetLog("Activate King's power", $COLOR_BLUE)
			SelectDropTroop($King)
		EndIf
		If $checkQPower Then
			SetLog("Activate Queen's power", $COLOR_BLUE)
			SelectDropTroop($Queen)
		EndIf
	EndIf
EndFunc   ;==>ALLDropheroes

Func SpellTHGrid($S)
   Setlog("start spell SpellTHGride " &$S)
	If $THi <= 86 Or $THside = 0 Or $THside = 2 Then
	    Switch $THside
		Case 0
		   If $THx <=200 and $Thy < 350 and $Thy > 280 then  ; In Left Corner
		      If $optSpellType = 0 Then
			 CastSpell($S,$THx,$THy)
		      EndIf
			CastSpell($S,55,314) ; Left Corner
		     Else
			If $THy < 110 and $THx > 400 and $THx < 470 then ; In Top Corner
			   If $optSpellType = 0 Then
			      CastSpell($S,$THx,$THy)
			   EndIf
			   CastSpell($S,428,50) ; Top Corner
			Else
			   If $optSpellType = 0 Then
			      CastSpell($S,$THx,$THy)
			   EndIf
			   ;$aThx = 430 - ($ii * 4)
			   ;$aThy = 30 + ($ii * 3)
			   CastSpell($S, 430 - ($THi * 4) + 8 , 30 + ($THi * 3)+6) ;Along Side
			EndIf
		     EndIf

		  Case 1
		      If $THx <=200 and $Thy < 350 and $Thy > 280 then  ; In Left Corner
			 If $optSpellType = 0 Then
			   CastSpell($S,$THx,$THy)
			   EndIf
			CastSpell($S,55,314) ; Left Corner
		     Else
			If $optSpellType = 0 Then
			 CastSpell($S,$THx,$THy)
			EndIf
			CastSpell($S, 70 + ($THi * 4) , 295 + ($THi * 3)) ;Along Side
		     EndIf

		  Case 2
			If $THy < 110 and $THx > 400 and $THx < 470 then ; In Top Corner
			   If $optSpellType = 0 Then
			      CastSpell($S,$THx,$THy)
			   EndIf
			      CastSpell($S,428,50) ; TopCorner
			Else
			      If $THx >=700 and $Thy < 350 and $Thy > 280 then  ; In Right Corner
				 If $optSpellType = 0 Then
				    CastSpell($S,$THx,$THy)
				 EndIf
				 CastSpell($S,790,314) ; Right Corner
			      Else
				    If $optSpellType = 0 Then
				       CastSpell($S,$THx,$THy)
				    EndIf
				 CastSpell($S, 410 + ($THi * 4) , 50 + ($THi * 3)) ;Along Side
			      EndIf
			EndIf

		     Case 3
			If $THx >=700 and $Thy < 350 and $Thy > 280 then  ; In Right Corner
			   If $optSpellType = 0 Then
			      CastSpell($S,$THx,$THy)
			   EndIf
			   CastSpell($S,790,314) ; Right Corner
			Else
			   If $optSpellType = 0 Then
			      CastSpell($S,$THx,$THy)
			   EndIf
			   CastSpell($S, 790 - ($THi * 4) , 295 + ($THi * 3)) ;Along Side
			EndIf
	   EndSwitch
	 Else
	    If $THi > 15 And ($optSpellType = 1 or $optSpellType = 2) Then
		  If ($THside = 1 Or $THside = 3) And $zoomedin = True Then
			CastSpell($S,730,430)
		  EndIf
	    EndIf
	 EndIf

EndFunc   ;==>SpellTHGrid

Func CastSpell($THSpell, $x, $y)
	Local $Spell = -1
	Local $name = ""
	For $i = 0 To UBound($atkTroops) - 1
		If $atkTroops[$i][0] = $THSpell Then
			$Spell = $i
			$name = NameOfTroop($THSpell, 0)
		EndIf
	Next

	If ($Spell = -1) Then Return False
	If $Spell > -1 Then
		SetLog("Dropping " & $name & " Spell!")
		SelectDropTroop($Spell)
		If _Sleep($iDelayCastSpell1) Then Return
		Click($x, $y, 1, 0, "#0029")
	Else
		SetLog("No " & $name & " Found")
	EndIf

EndFunc   ;==>CastSpell

Func AllZoomedAttack($num,$numperspot,$spots)
	If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
					;Zoom in all the way
					SetLog("Zooming in Max...")
					While $zCount < 5
						If _Sleep(Random(300,320)) Then Return
						ControlSend($Title, "", "", "{UP}")
						_Sleep(100)
						$zCount += 1
					WEnd
					SetLog("Done zooming.")

					;Scroll to bottom
					SetLog("Scrolling to bottom...")

					While $LTCount < 1
					ControlSend($Title, "", "", "{CTRLDOWN}{LEFT}{CTRLUP}")
						_Sleep(100)
						$LTCount +=1
					WEnd

					While $sCount < 8
						If _Sleep(Random(300,320)) Then Return
						ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						_Sleep(100)
						$sCount += 1
					WEnd
					$zoomedin = True
	EndIf
if $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then

					  Setlog("LC Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							Click(Random(550,650,1),Random(515,560,1),1,0,"#0022")
							If _Sleep(Random(30,60)) Then Return
						 Next
						 _Sleep(Random(40,100))
						Next


Else
				  If $THside=1 Then
						Setlog("LL Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							Click(Random(280,380,1),Random(365,420,1),1,0,"#0022")
							If _Sleep(Random(30,60)) Then Return
						 Next
						 _Sleep(Random(40,100))
						Next
				  EndIf

				  If $THside=3 Then
						Setlog("LR Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							   ;Click($aThx,$aThy)
							   Click(Random(780,855,1),Random(400,560,1),1,0,"#0022")
							   If _Sleep(Random(30,60)) Then Return
						 Next
						_Sleep(Random(40,100))
						Next

				  EndIf
EndIf
EndFunc

Func ModrateZoom($num,$numperspot,$spots)
	If _Sleep(Random(300,320)) Then Return
	If ($THside = 1 Or $THside = 3) And $zoomedin = False Then
					;Few zoom ;Scroll to bottom
					SetLog("Zooming in a little and scrolling to bottom ...")
					While $zCount < 2 And $sCount < 2
						ControlSend($Title, "", "", "{UP}")
						_Sleep(100)
						ControlSend($Title, "", "", "{CTRLDOWN}{UP}{CTRLUP}")
						_Sleep(100)
						$zCount += 1
						$sCount += 1
					WEnd

					SetLog("Done zooming.")
					_Sleep(500)
					$zoomedin = True
	EndIf
if $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then

					  Setlog("LC Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							Click(Random(450,510,1),Random(564,566,1),1,0,"#0022")
							If _Sleep(Random(30,60)) Then Return
						 Next
						 _Sleep(Random(40,100))
						Next


Else
				  If $THside=1 Then
						Setlog("LL Bottom deployment $THi="&$THi &"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							Click(Random(290,340,1),Random(564,566,1),1,0,"#0022")

							If _Sleep(Random(30,60)) Then Return
						 Next
						 _Sleep(Random(40,100))
						Next
				  EndIf

				  If $THside=3 Then
						Setlog("LR Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							   ;Click($aThx,$aThy)
							   Click(Random(630,700,1),Random(564,566,1),1,0,"#0022")
							   If _Sleep(Random(30,60)) Then Return
						 Next
						_Sleep(Random(40,100))
						Next

                  EndIf
EndIf
 EndFunc

Func SideSnipe($num,$numperspot,$spots)
SetLog("Attacking Th from sides ...")
if $THi=17 and $Thx>400 and $Thx<455 and $Thy>525 and $Thy<580 then
local $i=0
					  Setlog("LC Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							if $i=0 then
							Click(Random(355,365,1),Random(564,566,1),1,0,"#0022")
							$i=1
							else
							Click(Random(488,500,1),Random(564,566,1),1,0,"#0022")
							$i=0
							EndIf
							If _Sleep(Random(30,60)) Then Return
						 Next
						 _Sleep(Random(40,100))
						Next


Else

				  If $THside=1 Then
					  Setlog("LL Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							Click(Random(300,340,1),Random(564,566,1),1,0,"#0022")
							If _Sleep(Random(30,60)) Then Return
						 Next
						 _Sleep(Random(40,100))
						Next
	              EndIf

				  If $THside=3 Then
					  Setlog("LR Bottom deployment $THi="&$THi&"x"&$Thx &"y"&$Thy)
						For $num=0 to $numperspot-1
						 For $ii=$THi+1 to $THi+1+($spots-1)
							   Click(Random(510,540,1),Random(564,566,1),1,0,"#0022")
							   If _Sleep(Random(30,60)) Then Return
						 Next
						_Sleep(Random(40,100))
						Next

				  EndIf
EndIf
 EndFunc