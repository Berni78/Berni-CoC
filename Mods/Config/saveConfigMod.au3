#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:    The Master

    Script Function: saveConfigMod
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func saveConfigMod()

;Buildings info File
If FileExists($building) Then
;Heros upgrade
IniWrite($building, "other", "xKing", $KingPos[0])
IniWrite($building, "other", "yKing", $KingPos[1])
IniWrite($building, "other", "xQueen", $QueenPos[0])
IniWrite($building, "other", "yQueen", $QueenPos[1])

EndIf

;Bot Configuration File
If FileExists($config) Then

; Return normal settings after being changed by snipe while train
SWHTrainRevertNormal()

; Snipe while train
If GUICtrlRead($chkSnipeWhileTrain) = $GUI_CHECKED Then
    IniWrite($config, "advanced", "chkSnipeWhileTrain", "1")
Else
    IniWrite($config, "advanced", "chkSnipeWhileTrain", "0")
EndIf

IniWrite($config, "advanced", "txtSearchlimit", GUICtrlRead($txtSearchlimit))

;Train Spells
IniWrite($config, "advanced", "cmbTrainNormalSpellType", _GUICtrlComboBox_GetCurSel($cmbTrainNormalSpellType))
IniWrite($config, "advanced", "cmbTrainDarkSpellType", _GUICtrlComboBox_GetCurSel($cmbTrainDarkSpellType))

If GUICtrlRead($chkTrainSpells) = $GUI_CHECKED Then
    IniWrite($config, "advanced", "chkTrainSpells", "1")
Else
    IniWrite($config, "advanced", "chkTrainSpells", "0")
EndIf

;Attack bottom townhall type
IniWrite($config, "advanced", "BottomTHType", _GUICtrlComboBox_GetCurSel($cmbAttackbottomType))

;Heros upgrade
If GUICtrlRead($chkUpgradeKing) = $GUI_CHECKED Then
    IniWrite($config, "upgrade", "UpgradeKing","1")
Else
    IniWrite($config, "upgrade", "UpgradeKing","0")
EndIf

If GUICtrlRead($chkUpgradeQueen) = $GUI_CHECKED Then
    IniWrite($config, "upgrade", "UpgradeQueen","1")
Else
	IniWrite($config, "upgrade", "UpgradeQueen","0")
EndIf

;De Smart Drills Zap
;ichkSmartLightSpell DE Smart Lightning Zap
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		IniWrite($config, "advanced", "SmartLightSpell", "1")
	Else
		IniWrite($config, "advanced", "SmartLightSpell", "0")
	EndIf

;4 Fingers Barch
IniWrite($config, "attack", "DBDeploy", _GUICtrlComboBox_GetCurSel($cmbDBDeploy))
IniWrite($config, "attack", "ABDeploy", _GUICtrlComboBox_GetCurSel($cmbABDeploy))
IniWrite($config, "attack", "DBUnitD", _GUICtrlComboBox_GetCurSel($cmbDBUnitDelay))
IniWrite($config, "attack", "ABUnitD", _GUICtrlComboBox_GetCurSel($cmbABUnitDelay))

;Attack Townhall Type
IniWrite($config, "advanced", "AttackTHType", _GUICtrlComboBox_GetCurSel($cmbAttackTHType))


;Halt on Dark Conditions
IniWrite($config, "general", "Cond", _GUICtrlComboBox_GetCurSel($cmbBotCond))
EndIf
EndFunc
