#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: Control GUI For remote addition of mods
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------

;Heroes upgrade
Global $KingPos[2] = [-1, -1]
Global $QueenPos[2] = [-1, -1]
Global $sInfoKing
Global $sInfoQueen
Global $ichkUpgradeKing
Global $ichkUpgradeQueen

;Trapped Th
Global $TrappedAllIn = False
Global $icmbDetectTrapedTH

; Additional Th images
Global $ct
Global $ci
Global $debugTH = 0 ; use this to add info to the log 0 is off, 1 is on
Global $CTHx=0, $CTHy=0
Global $thinfo


; Advanced stats
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
Global $ECountBeforeTrain = 0
Global $DCountBeforeTrain = 0
Global $ECountAfterTrain = 0
Global $DCountAfterTrain = 0
Global $NextCost = 0
Global $searchCost = 0
Global $LastGMod = 0
Global $LastEMod = 0
Global $LastDMod = 0
Global $LastTMod = 0

;Smart Zap
Global $smartZapGain = 0
Global $NumLTSpellsUsed = 0
Global $ichkSmartLightSpell

; Remove obstacles
Global $CoRunCounter = 0


;Save Troops
Global $saveTroops = 0
Global $countFindPixCloser = 0
Global $countCollectorexposed = 0
Global $percentCollectors
Global $useFFBarchST
Global $upTrophy = 0
Global $endbattle = False
Global $Attack4fingers = False
Global $icmbInsideCol

;Snipe While Train
Global $isSnipeWhileTrain
Global $SnipeChangedSettings = False
Global $tempSnipeWhileTrain[12] = [0,0,0,0,0,0,0,0,0,0,0,0]
Global $iChkSnipeWhileTrain
Global $itxtSearchlimit

;Train Spells
Global $ichkTrainSpells
Global $NormalSpellTrain
Global $DarkSpellTrain

;Bottom TH Attacks
Global $BottomTHType

;TH Attacks
Global $AttackTHType

;Halt on Dark
Global $itxtMinDark

;Use Spell TH
Global $ichkUseSpellsTH
