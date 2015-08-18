#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: readConfigMod
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Global $ichkTrainSpells
Global $itxtSearchlimit
Global $BottomTHType
Global $ichkTrainSpells
Global $NormalSpellTrain
Global $DarkSpellTrain
Global $AttackTHType
Global $ichkUpgradeKing
Global $ichkUpgradeQueen
Global $ichkSmartLightSpell
Global $ichkSmartLightSpell


Func readConfigMod()

;Buildings info File
If FileExists($building) Then
;Heros upgrade
$KingPos[0] = IniRead($building, "other", "xKing", "-1")
$KingPos[1] = IniRead($building, "other", "yKing", "-1")
$QueenPos[0] = IniRead($building, "other", "xQueen", "-1")
$QueenPos[1] = IniRead($building, "other", "yQueen", "-1")


EndIf

;Bot Configuration File
If FileExists($config) Then


;4 Fingers barch
$iChkDeploySettings[$DB] = IniRead($config, "attack", "DBDeploy", "3")
$iChkDeploySettings[$LB] = IniRead($config, "attack", "ABDeploy", "0")
$iCmbUnitDelay[$DB] = IniRead($config, "attack", "DBUnitD", "5")
$iCmbUnitDelay[$LB] = IniRead($config, "attack", "ABUnitD", "5")


;Snipe While Train
$iChkSnipeWhileTrain = IniRead($config, "advanced", "chkSnipeWhileTrain", "0")
$itxtSearchlimit = IniRead($config, "advanced", "txtSearchlimit", "15")

;Attack bottom Th type
$BottomTHType = IniRead($config, "advanced", "BottomTHType", "0")

;Train Spells
$ichkTrainSpells = IniRead($config, "advanced", "chkTrainSpells", "0")
$NormalSpellTrain = IniRead($config, "advanced", "cmbTrainNormalSpellType", "0")
$DarkSpellTrain = IniRead($config, "advanced", "cmbTrainDarkSpellType", "0")

;Th Snipe Attack type
$AttackTHType = IniRead($config, "advanced", "AttackTHType", "0")

;Heros upgrade
$ichkUpgradeKing = IniRead($config, "upgrade", "UpgradeKing", "0")
$ichkUpgradeQueen = IniRead($config, "upgrade", "UpgradeQueen", "0")

;DE Smart Drills Zap
$ichkSmartLightSpell = IniRead($config, "advanced", "SmartLightSpell", "0")

;Halt on Dark Conditions
$icmbBotCond = IniRead($config, "general", "Cond", "0")

EndIf

EndFunc