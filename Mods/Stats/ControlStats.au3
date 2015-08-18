#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:         The Master

    Script Function: Control Advanced stats
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Global $GModTotal = 0
Global $EModTotal = 0
Global $DModTotal = 0
Global $GoldGain = 0
Global $ElixerGain = 0
Global $DarkGain = 0
Global $TrophyGain = 0
Global $GBounsTotal = 0
Global $EBounsTotal = 0
Global $DBounsTotal = 0
Global $OOSCounter = 0
Global $ArmyECost = 0
Global $ArmyDCost = 0
Global $ECountAfterTrain = 0
Global $DCountAfterTrain = 0
Global $NextCost = 0
Global $searchCost = 0
Global $LastGMod = 0
Global $LastEMod = 0
Global $LastDMod = 0
Global $LastTMod = 0


Func ShowThLvl()
GUICtrlSetData($lblResultTHLVL,$iTownHallLevel)
EndFunc

Func SearchCost()

Switch $iTownHallLevel
	Case 1
		$NextCost = 10
	Case 2
		$NextCost = 50
	Case 3
		$NextCost = 75
	Case 4
		$NextCost = 110
	Case 5
		$NextCost = 170
	Case 6
		$NextCost = 250
	Case 7
		$NextCost = 380
	Case 8
		$NextCost = 580
	Case 9
		$NextCost = 750
	Case 10
		$NextCost = 1000
EndSwitch

$searchCost = Int (GUICtrlRead($lblresultvillagesskipped)* $NextCost)
GUICtrlSetData($lblresultSearchCost , _NumberFormat($searchCost) )

EndFunc


Func GetResReport()

        $LastGMod =  getResourcesLoot(333, 289)
		If _Sleep($iDelayAttackReport2) Then Return
		$LastEMod =  getResourcesLoot(333, 328)
		If _Sleep($iDelayAttackReport2) Then Return
		$LastDMod =  getResourcesLootDE(365, 365)
		If _Sleep($iDelayAttackReport2) Then Return
		$LastTMod =  getResourcesLootT(403, 402)
		If _ColorCheck(_GetPixelColor($aAtkRprtTrophyCheck[0], $aAtkRprtTrophyCheck[1], True), Hex($aAtkRprtTrophyCheck[2], 6), $aAtkRprtTrophyCheck[3]) Then
			$LastTMod = -$LastTMod
		EndIf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EndFunc

func UpLast()

		GUICtrlSetData($lblGoldLastAttackMod, _NumberFormat($LastGMod))
		GUICtrlSetData($lblElixirLastAttackMod, _NumberFormat($LastEMod))
		GUICtrlSetData($lblTrophyLastAttackMod, _NumberFormat($LastTMod))

		If $LastDMod = "" Then
		GUICtrlSetData($lblDarkLastAttackMod,"0")
		Else
		GUICtrlSetData($lblDarkLastAttackMod, _NumberFormat($LastDMod))
		EndIf

EndFunc

Func UpTotal()

$GModTotal += ($LastGMod )
$EModTotal += ($LastEMod )
$DModTotal += ($LastDMod )


$GoldGain   = ( ($GModTotal) + ($GBounsTotal) - ($searchCost) )
$ElixerGain = ( ($EModTotal) + ($EBounsTotal) - ($ArmyECost) )
$DarkGain   = ( ($DModTotal) + ($DBounsTotal) - ($ArmyDCost) )
$TrophyGain += ($LastTMod)

If $FirstAttack = 1 Then GUICtrlSetState($lblTotalLootTempMod, $GUI_HIDE)
GUICtrlSetData($lblGoldLootMod , _NumberFormat($GoldGain) )
GUICtrlSetData($lblElixirLootMod , _NumberFormat($ElixerGain) )
GUICtrlSetData($lblTrophyLootMod , _NumberFormat($TrophyGain) )

If $DarkGain = "" Then
GUICtrlSetData($lblDarkLootMod , "0" )
Else
GUICtrlSetData($lblDarkLootMod , _NumberFormat($DarkGain) )
EndIf

EndFunc

Func UpBouns()

$GBounsTotal += $BonusLeagueG
$EBounsTotal += $BonusLeagueE
$DBounsTotal += $BonusLeagueD

If $FirstAttack = 1 Then GUICtrlSetState($lblLastAttackBounsTemp, $GUI_HIDE)
If $FirstAttack = 1 Then GUICtrlSetState($lblHourlyBounsTemp, $GUI_HIDE)
If $FirstAttack = 1 Then GUICtrlSetState($lblTotalBounsTemp, $GUI_HIDE)

;Bouns stats
GUICtrlSetData($lblBounsGLastAttack , _NumberFormat($BonusLeagueG) )
GUICtrlSetData($lblBounsELastAttack , _NumberFormat($BonusLeagueE) )

If $BonusLeagueD = "" Then
GUICtrlSetData($lblBounsDELastAttack , "0" )
Else
GUICtrlSetData($lblBounsDELastAttack , _NumberFormat($BonusLeagueD) )
EndIf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GUICtrlSetData($lblBounsGTotal , _NumberFormat($GBounsTotal) )
GUICtrlSetData($lblBounsETotal , _NumberFormat($EBounsTotal) )

If $DBounsTotal = "" Then
GUICtrlSetData($lblBounsDETotal , "0" )
Else
GUICtrlSetData($lblBounsDETotal , _NumberFormat($DBounsTotal) )
EndIf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GUICtrlSetData($lblBounsGHourly, StringFormat("%d",Int( $GBounsTotal / Int(TimerDiff($sTimer)) * 3600)) & "k/h")
GUICtrlSetData($lblBounsEHourly, StringFormat("%d",Int( $EBounsTotal / Int(TimerDiff($sTimer)) * 3600)) & "k/h")
GUICtrlSetData($lblBounsDEHourly, StringFormat("%d",Int( $DBounsTotal / Int(TimerDiff($sTimer)) * 3600* 1000)) & "/h")

EndFunc

Func UpHourly()
; Hourly stats
GUICtrlSetState($lblHourlyStatsTemp, $GUI_HIDE)
GUICtrlSetData($lblHourlyStatsGold, StringFormat("%d",Int( $GoldGain / Int(TimerDiff($sTimer)) * 3600)) & "k/h")
GUICtrlSetData($lblHourlyStatsElixir, StringFormat("%d",Int( $ElixerGain / Int(TimerDiff($sTimer)) * 3600)) & "k/h")
GUICtrlSetData($lblHourlyStatsDark, StringFormat("%d",Int( $DarkGain / Int(TimerDiff($sTimer)) * 3600 * 1000)) & "/h")
GUICtrlSetData($lblHourlyStatsTrophy, StringFormat("%d",Int( $TrophyGain / Int(TimerDiff($sTimer)) * 3600 * 1000)) & "/h")
EndFunc

Func UpOOS()
;OOS state
$OOSCounter +=1
GUICtrlSetData($lblresultoutofsync , _NumberFormat($OOSCounter) )
EndFunc

Func ReadResTrain()
	Local $iCount = 0
	While _CheckPixel($aIsMain, $bCapturePixel) = False
		If _Sleep(100) Then Return
		$iCount += 1
		If $iCount > 50 Then ExitLoop
	WEnd

	$ElixirCount = getResourcesMainScreen(710, 74)
	$DarkCount = getResourcesMainScreen(731, 123)

EndFunc

Func GetArmyCost()
	Local $iCount = 0
	While _CheckPixel($aIsMain, $bCapturePixel) = False
		If _Sleep(100) Then Return
		$iCount += 1
		If $iCount > 50 Then ExitLoop
	WEnd

	$ECountAfterTrain = getResourcesMainScreen(710, 74)
	$DCountAfterTrain = getResourcesMainScreen(731, 123)

local $LastECost= $ElixirCount - $ECountAfterTrain
local $LastDCost= $DarkCount - $DCountAfterTrain

	$ArmyECost += $LastECost
	$ArmyDCost += $LastDCost

GUICtrlSetState($lblArmyCostsTemp, $GUI_HIDE)

If $ArmyECost = "" Then
GUICtrlSetData($lblArmyElixirCost , "0" )
Else
GUICtrlSetData($lblArmyElixirCost , _NumberFormat($ArmyECost) )
EndIf

If $ArmyDCost = "" Then
GUICtrlSetData($lblArmyDECost , "0" )
Else
GUICtrlSetData($lblArmyDECost , _NumberFormat($ArmyDCost) )
EndIf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GUICtrlSetData($lblArmyHourlyECost, StringFormat("%d",Int( $ArmyECost / Int(TimerDiff($sTimer)) * 3600)) & "k/h")
GUICtrlSetData($lblArmyHourlyDECost, StringFormat("%d",Int( $ArmyDCost / Int(TimerDiff($sTimer)) * 3600 * 1000)) & "/h")

EndFunc



Func UpgradeModStates()
UpBouns()
UpTotal()
UpHourly()
UpLast()
ResetVariables()
EndFunc


Func ResetVariables()
;Prevent Leaking
$BonusLeagueG = 0
$BonusLeagueE = 0
$BonusLeagueD = 0
$ElixirCount = 0
$ECountAfterTrain = 0
$DarkCount = 0
$DCountAfterTrain = 0
$LastGMod = 0
$LastEMod = 0
$LastDMod = 0
$LastTMod = 0
EndFunc