#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  Mhazwankamal  ( Modified By The Master)

    Script Function: 4 fingers barch
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------


GUICtrlSetData($cmbDBDeploy, "Smart Save troops", "all sides equally")

GUISwitch($frmBot, $tabAttackAdv)
        $x = 320
		$y = 150
$grpSaveTroops = GUICtrlCreateGroup("Save Troops", $x - 10, $y - 20, 150, 100)

		local $txtTip = "If collectors outside less than Percent Do Action"
		$chkChangeFF = GUICtrlCreateCheckbox("If outside col. less than", $x  , $y  , -1, -1)
		GUICtrlSetTip(-1, $txtTip)
		$txtTHpercentCollectors = GUICtrlCreateInput("80", $x, $y + 30, 21, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetLimit(-1, 100)
		$lblChangeFF = GUICtrlCreateLabel("% Use ", $x + 22 , $y + 33 , -1, -1)
		GUICtrlSetTip(-1, $txtTip)
		$cmbInsideCol = GUICtrlCreateCombo("",  $x + 55, $y + 30, 80, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	    GUICtrlSetData(-1, "1: 4Sides|2: 4Fingers|3:Return" , "3:Return")
	    GUICtrlSetOnEvent(-1, "cmbInsideCol")

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")




Func cmbInsideCol()
IniWrite($config, "advanced", "cmbInsideCol", _GUICtrlComboBox_GetCurSel($cmbInsideCol))
EndFunc







Func SmartSaveTroops( $King , $Queen , $CC )
If $iChkDeploySettings[$iMatchMode] = 4 Then
	SetLog("Attacking with save troops for collectors", $COLOR_BLUE)

	SetLog("Calculating Smart Attack Strategy", $COLOR_BLUE)
		Local $hTimer = TimerInit()
		_WinAPI_DeleteObject($hBitmapFirst)
		$hBitmapFirst = _CaptureRegion2()
		_GetRedArea()

		SetLog("Calculated  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")

			SetLog("Locating Mines, Collectors & Drills", $COLOR_BLUE)
			$hTimer = TimerInit()
			Global $PixelMine[0]
			Global $PixelElixir[0]
			Global $PixelDarkElixir[0]
			Global $PixelNearCollector[0]

			; If drop troop near gold mine
				$PixelMine = GetLocationMine()
				If (IsArray($PixelMine)) Then
					_ArrayAdd($PixelNearCollector, $PixelMine)
				EndIf


			; If drop troop near elixir collector
				$PixelElixir = GetLocationElixir()
				If (IsArray($PixelElixir)) Then
					_ArrayAdd($PixelNearCollector, $PixelElixir)
				EndIf


            SetLog("Located  (in " & Round(TimerDiff($hTimer) / 1000, 2) & " seconds) :")
			SetLog("[" & UBound($PixelMine) & "] Gold Mines")
			SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")





$nbSides = 4
$saveTroops = 1
Local $listInfoDeploy[11][5] = [[$eGiant, $nbSides, 1, 2, 2] _
			, [$eBarb, $nbSides, 1, 3, 0] _
			, [$eWall, $nbSides, 1, 2, 1] _
			, [$eArch, $nbSides, 1, 3, 0] _
			, [$eGobl, $nbSides, 1, 3, 0] _
			, ["CC", 1, 1, 1, 1] _
			, [$eHogs, $nbSides, 1, 2, 1] _
			, [$eWiza, $nbSides, 1, 2, 0] _
			, [$eMini, $nbSides, 1, 3, 0] _
			, [$eGobl, $nbSides, 2, 3, 0] _
			, ["HEROES", 1, 2, 1, 1] _
			]


LaunchTroopSave($listInfoDeploy, $CC, $King, $Queen)

CheckHeroesHealth()

	If $endbattle then
		ClickP($aSurrenderButton, 1, 0, "#0030") ;Click Surrender
		If _Sleep(3000) Then Return
		ClickP($aConfirmSurrender, 1, 0, "#0031") ;Click Confirm
	Return True
	EndIf

PrepareAttack($iMatchMode, True) ;Check remaining quantities


Endif
EndFunc

Func LaunchTroopSave($listInfoDeploy, $CC, $King, $Queen)
	Local $listListInfoDeployTroopPixel[0]
    $countFindPixCloser = 0
	$countCollectorexposed=0
		For $i = 0 To UBound($listInfoDeploy) - 1
			Local $troop = -1
			Local $troopNb = 0
			Local $name = ""
			$troopKind = $listInfoDeploy[$i][0]
			$nbSides = $listInfoDeploy[$i][1]
			$waveNb = $listInfoDeploy[$i][2]
			$maxWaveNb = $listInfoDeploy[$i][3]
			$slotsPerEdge = $listInfoDeploy[$i][4]
			If (IsNumber($troopKind)) Then
				For $j = 0 To UBound($atkTroops) - 1 ; identify the position of this kind of troop
					If $atkTroops[$j][0] = $troopKind Then
						$troop = $j
						$troopNb = Ceiling($atkTroops[$j][1] / $maxWaveNb)
						Local $plural = 0
						If $troopNb > 1 Then $plural = 1
						$name = NameOfTroop($troopKind, $plural)
					EndIf
				Next
			EndIf
			If ($troop <> -1 And $troopNb > 0) Or IsString($troopKind) Then
				Local $listInfoDeployTroopPixel
				If (UBound($listListInfoDeployTroopPixel) < $waveNb) Then
					ReDim $listListInfoDeployTroopPixel[$waveNb]
					Local $newListInfoDeployTroopPixel[0]
					$listListInfoDeployTroopPixel[$waveNb - 1] = $newListInfoDeployTroopPixel
				EndIf
				$listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$waveNb - 1]

				ReDim $listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) + 1]
				If (IsString($troopKind)) Then
					Local $arrCCorHeroes[1] = [$troopKind]
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $arrCCorHeroes
				Else
					Local $infoDropTroop = DropTroop2($troop, $nbSides, $troopNb, $slotsPerEdge, $name)
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $infoDropTroop
				EndIf
				$listListInfoDeployTroopPixel[$waveNb - 1] = $listInfoDeployTroopPixel
			EndIf
		Next
		Local $isCCDropped = False
		Local $isHeroesDropped = False

		if $saveTroops = 1 and $useFFBarchST = 1 then
		$endbattle = false
		Setlog ("There are " & $countCollectorexposed & " collector(s) near RED LINE out of " & Ubound($PixelNearCollector) & " collectors")
		if _Sleep(100) then return

		If ($countCollectorexposed/Ubound($PixelNearCollector)*100) < $percentCollectors then
            Switch ($icmbInsideCol +1)
			    Case 1
					SetLog("Changing Attack Strategy to All Sides Attack!...")
				    if _Sleep(50) then return
				    $nbSides = 4
					Local $listInfoDeployAll[14][5] = [[$eGiant, $nbSides, 1, 1, 2] _
			        , [$eBarb, $nbSides, 1, 2, 0] _
			        , [$eWall, $nbSides, 1, 1, 1] _
			        , [$eArch, $nbSides, 1, 2, 0] _
			        , [$eBarb, $nbSides, 2, 2, 0] _
			        , [$eGobl, $nbSides, 1, 2, 0] _
			        , ["CC", 1, 1, 1, 1] _
			        , [$eHogs, $nbSides, 1, 1, 1] _
			        , [$eWiza, $nbSides, 1, 1, 0] _
			        , [$eBall, $nbSides, 1, 1, 0] _
			        , [$eMini, $nbSides, 1, 1, 0] _
			        , [$eArch, $nbSides, 2, 2, 0] _
			        , [$eGobl, $nbSides, 2, 2, 0] _
			        , ["HEROES", 1, 2, 1, 1] _
			        ]

            LaunchTroop2($listInfoDeployAll, $CC, $King, $Queen)
				Return
			Case 2
				SetLog("Changing Attack Strategy to Four Finger Barch!...")
		        if _Sleep(50) then return
                $Attack4fingers = True
                IsFourFingersDeploy( $King , $Queen , $CC )
	        	Return
            Case 3
				$endbattle = True
				$Restart = True
				Return
		EndSwitch
        Endif

	    Endif


		If ($iCmbSmartDeploy[$iMatchMode] = 0) Then
			For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
				Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
				For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
					Local $infoPixelDropTroop = $listInfoDeployTroopPixel[$i]
					If (IsString($infoPixelDropTroop[0]) And ($infoPixelDropTroop[0] = "CC" Or $infoPixelDropTroop[0] = "HEROES")) Then
						;TEMP FIX NEED TO IMPROVED... IF NO PIXELREDAREA DEPLOY IN A PRECISE POINT
						;Local $pixelRandomDrop = $PixelRedArea[Round(Random(0, UBound($PixelRedArea) - 1))]
						If Ubound($PixelRedArea) > 0 Then
							Local $pixelRandomDrop = $PixelRedArea[Random(0, UBound($PixelRedArea) - 1,1)]
						Else
							Local $pixelRandomDrop = [747,367] ;
						EndIf
						;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

						If ($infoPixelDropTroop[0] = "CC") Then
							dropCC($pixelRandomDrop[0], $pixelRandomDrop[1], $CC)
						ElseIf ($infoPixelDropTroop[0] = "HEROES") Then
							dropHeroes($pixelRandomDrop[0], $pixelRandomDrop[1], $King, $Queen)
							$isHeroesDropped = True
						EndIf
					Else
						If _Sleep($iDelayLaunchTroop21) Then Return
						SelectDropTroop($infoPixelDropTroop[0]) ;Select Troop
						If _Sleep($iDelayLaunchTroop21) Then Return
						Local $waveName = "first"
						If $numWave + 1 = 2 Then $waveName = "second"
						If $numWave + 1 = 3 Then $waveName = "third"
						If $numWave + 1 = 0 Then $waveName = "last"
						SetLog("Dropping " & $waveName & " wave of " & $infoPixelDropTroop[5] & " " & $infoPixelDropTroop[4], $COLOR_GREEN)


						DropOnPixel($infoPixelDropTroop[0], $infoPixelDropTroop[1], $infoPixelDropTroop[2], $infoPixelDropTroop[3])
					EndIf
					If ($isHeroesDropped) Then
						If _Sleep($iDelayLaunchTroop22) then return ; delay Queen Image  has to be at maximum size : CheckHeroesHealth checks the y = 573
						CheckHeroesHealth()
					EndIf
					If _Sleep(SetSleep(1)) Then Return
				Next
			Next
		Else
			For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
				Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
				If (UBound($listInfoDeployTroopPixel) > 0) Then
					Local $infoTroopListArrPixel = $listInfoDeployTroopPixel[0]
					Local $numberSidesDropTroop = 1

					For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
						$infoTroopListArrPixel = $listInfoDeployTroopPixel[$i]
						If (UBound($infoTroopListArrPixel) > 1) Then
							Local $infoListArrPixel = $infoTroopListArrPixel[1]
							$numberSidesDropTroop = UBound($infoListArrPixel)
							ExitLoop
						EndIf
					Next

					If ($numberSidesDropTroop > 0) Then
						For $i = 0 To $numberSidesDropTroop - 1
							For $j = 0 To UBound($listInfoDeployTroopPixel) - 1
								$infoTroopListArrPixel = $listInfoDeployTroopPixel[$j]
								If (IsString($infoTroopListArrPixel[0]) And ($infoTroopListArrPixel[0] = "CC" Or $infoTroopListArrPixel[0] = "HEROES")) Then
									;TEMP FIX NEED TO IMPROVED... IF NO PIXELREDAREA DEPLOY IN A PRECISE POINT
									;Local $pixelRandomDrop = $PixelRedArea[Round(Random(0, UBound($PixelRedArea) - 1))]
									If Ubound($PixelRedArea) > 0 Then
										Local $pixelRandomDrop = $PixelRedArea[Random(0, UBound($PixelRedArea) - 1,1)]
									Else
										Local $pixelRandomDrop = [747,367] ;
									EndIf
									;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

									If ($isCCDropped = False And $infoTroopListArrPixel[0] = "CC") Then
										dropCC($pixelRandomDrop[0], $pixelRandomDrop[1], $CC)
										$isCCDropped = True
									ElseIf ($isHeroesDropped = False And $infoTroopListArrPixel[0] = "HEROES" And $i = $numberSidesDropTroop - 1) Then
										dropHeroes($pixelRandomDrop[0], $pixelRandomDrop[1], $King, $Queen)
										$isHeroesDropped = True
									EndIf
								Else
									$infoListArrPixel = $infoTroopListArrPixel[1]
									$listPixel = $infoListArrPixel[$i]
									;infoPixelDropTroop : First element in array contains troop and list of array to drop troop
									If _Sleep($iDelayLaunchTroop21) Then Return
									SelectDropTroop($infoTroopListArrPixel[0]) ;Select Troop
									If _Sleep($iDelayLaunchTroop23) Then Return
									SetLog("Dropping " & $infoTroopListArrPixel[2] & "  of " & $infoTroopListArrPixel[5] & " => on each side (side : " & $i + 1 & ")", $COLOR_GREEN)
									Local $pixelDropTroop[1] = [$listPixel]
									DropOnPixel($infoTroopListArrPixel[0], $pixelDropTroop, $infoTroopListArrPixel[2], $infoTroopListArrPixel[3])
								EndIf
								If ($isHeroesDropped) Then
									If _sleep (1000) then return ; delay Queen Image  has to be at maximum size : CheckHeroesHealth checks the y = 573
									CheckHeroesHealth()
								EndIf
							Next
						Next
					EndIf
				EndIf
				If _Sleep(SetSleep(1)) Then Return
			Next
		EndIf

		if $saveTroops = 1 then
		$endbattle = false
		Local $TimeWaitSaveColl = 5,$timeSC = 0

			;Activate KQ's power
	    If ($checkKPower Or $checkQPower) And $iActivateKQCondition = "Manual" Then
		SetLog("Waiting " & $delayActivateKQ / 1000 & " seconds before activating Hero abilities", $COLOR_BLUE)
		_Sleep($delayActivateKQ)
		$TimeWaitSaveColl =$TimeWaitSaveColl - 2
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

		For $saveWave = 0 to 3

			$timeSC = 0

			$TimeWaitSaveColl = 5
			If $saveWave = 0 Then $TimeWaitSaveColl = 0

			While $timeSC < $TimeWaitSaveColl

			If _Sleep(1000) Then Return
            CheckHeroesHealth()
			$timeSC +=1

			Wend

			If _Sleep(150) Then Return

			Setlog("Checking for remaining collectors...")

			Local $foundRemainingCollectors = false
		    _WinAPI_DeleteObject($hBitmapFirst)
	    	$hBitmapFirst = _CaptureRegion2()

			Global $PixelMine[0]
			Global $PixelElixir[0]
			Global $PixelDarkElixir[0]
			Global $PixelNearCollector[0]

			; If drop troop near gold mine
				$PixelMine = GetLocationMine()
				If (IsArray($PixelMine)) Then
					_ArrayAdd($PixelNearCollector, $PixelMine)
					$foundRemainingCollectors = true
				EndIf

			; If drop troop near elixir collector
				$PixelElixir = GetLocationElixir()
				If (IsArray($PixelElixir)) Then
					_ArrayAdd($PixelNearCollector, $PixelElixir)
					$foundRemainingCollectors = true
				EndIf

			; If drop troop near dark elixir drill
				$PixelDarkElixir = GetLocationDarkElixir()
				If (IsArray($PixelDarkElixir)) Then
					_ArrayAdd($PixelNearCollector, $PixelDarkElixir)
					$foundRemainingCollectors = true
				EndIf


			If $foundRemainingCollectors  Then
			SetLog("[" & UBound($PixelMine) & "] Gold Mines")
			SetLog("[" & UBound($PixelElixir) & "] Elixir Collectors")
			SetLog("[" & UBound($PixelDarkElixir) & "] Dark Elixir Drill/s")
         	if $saveWave = 5 then
			SetLog("Continue attacking with remaining troops...")

			Return
	        Else
			SetLog("Continue attacking...")
	        Endif
			Local $TotalArmyNeed = 0 ;required army for remaining collectors, basis 5 bar and 5 arch each
			$TotalArmyNeed=UBound($PixelNearCollector) * 5

			Else

			If not $foundRemainingCollectors then SetLog("No remaining collectors. End battle!...")
			$endbattle = true
			return
            Endif

	Local $listListInfoDeployTroopPixel[0]

		For $i = 0 To UBound($listInfoDeploy) - 1
			Local $troop = -1
			Local $troopNb = 0
			Local $name = ""
			$troopKind = $listInfoDeploy[$i][0]
			$nbSides = $listInfoDeploy[$i][1]
			$waveNb = $listInfoDeploy[$i][2]
			$maxWaveNb = $listInfoDeploy[$i][3]
			$slotsPerEdge = $listInfoDeploy[$i][4]
			If (IsNumber($troopKind)) Then
				For $j = 0 To UBound($atkTroops) - 1 ; identify the position of this kind of troop
					If $atkTroops[$j][0] = $troopKind Then
						$troop = $j
						$troopNb = Ceiling($atkTroops[$j][1] / $maxWaveNb)
						Local $plural = 0
						If $troopNb > 1 Then $plural = 1
						$name = NameOfTroop($troopKind, $plural)
					EndIf
				Next
			EndIf
			If ($troop <> -1 And $troopNb > 0) Or IsString($troopKind) Then
				Local $listInfoDeployTroopPixel
				If (UBound($listListInfoDeployTroopPixel) < $waveNb) Then
					ReDim $listListInfoDeployTroopPixel[$waveNb]
					Local $newListInfoDeployTroopPixel[0]
					$listListInfoDeployTroopPixel[$waveNb - 1] = $newListInfoDeployTroopPixel
				EndIf
				$listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$waveNb - 1]

				ReDim $listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) + 1]
				If (IsString($troopKind)) Then
					Local $arrCCorHeroes[1] = [$troopKind]
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $arrCCorHeroes
				Else
					Local $infoDropTroop = DropTroop2($troop, $nbSides, $troopNb, $slotsPerEdge, $name)
					$listInfoDeployTroopPixel[UBound($listInfoDeployTroopPixel) - 1] = $infoDropTroop
				EndIf
				$listListInfoDeployTroopPixel[$waveNb - 1] = $listInfoDeployTroopPixel
			EndIf
		Next

		For $numWave = 0 To UBound($listListInfoDeployTroopPixel) - 1
			Local $listInfoDeployTroopPixel = $listListInfoDeployTroopPixel[$numWave]
			For $i = 0 To UBound($listInfoDeployTroopPixel) - 1
				Local $infoPixelDropTroop = $listInfoDeployTroopPixel[$i]
				If Not (IsString($infoPixelDropTroop[0]) And ($infoPixelDropTroop[0] = "CC" Or $infoPixelDropTroop[0] = "HEROES")) Then
					Local $numberLeft = ReadTroopQuantity($infoPixelDropTroop[0])
					if $numberLeft - $TotalArmyNeed > 0 and $saveWave <> 2 then
					$numberLeft =$TotalArmyNeed
					Endif
					;SetLog("NumberLeft : " & $numberLeft)
					If ($numberLeft > 0) Then
						If _Sleep(100) Then Return
						SelectDropTroop($infoPixelDropTroop[0]) ;Select Troop
						If _Sleep(300) Then Return
						SetLog("Dropping another " & $numberLeft & "  of " & $infoPixelDropTroop[5], $COLOR_GREEN)

						DropOnPixel($infoPixelDropTroop[0], $infoPixelDropTroop[1], Ceiling($numberLeft / UBound($infoPixelDropTroop[1])), $infoPixelDropTroop[3])
					EndIf
				EndIf
			Next
		Next

	Next

EndIf
Return True
EndFunc   ;==>LaunchTroop2

