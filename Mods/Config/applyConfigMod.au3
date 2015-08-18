#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:         The Master

    Script Function: applyConfigMod
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func applyConfigMod()


;4Fingers barch
_GUICtrlComboBox_SetCurSel($cmbDBDeploy, $iChkDeploySettings[$DB])
_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, $iCmbUnitDelay[$DB])
_GUICtrlComboBox_SetCurSel($cmbABDeploy, $iChkDeploySettings[$LB])
_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, $iCmbUnitDelay[$LB])


;Heroes upgrade
If $ichkUpgradeKing = 1 Then
    GUICtrlSetState($chkUpgradeKing, $GUI_CHECKED)
Else
    GUICtrlSetState($chkUpgradeKing, $GUI_UNCHECKED)
EndIf
If $ichkUpgradeQueen = 1 Then
    GUICtrlSetState($chkUpgradeQueen, $GUI_CHECKED)
Else
    GUICtrlSetState($chkUpgradeQueen, $GUI_UNCHECKED)
EndIf


;Train Spells
If $ichkTrainSpells = 1 Then
    GUICtrlSetState($chkTrainSpells, $GUI_CHECKED)
	chkTrainSpells()
Else
    GUICtrlSetState($chkTrainSpells, $GUI_UNCHECKED)
	chkTrainSpells()
EndIf

_GUICtrlComboBox_SetCurSel($cmbTrainNormalSpellType, $NormalSpellTrain)
cmbTrainNormalSpellType()
_GUICtrlComboBox_SetCurSel($cmbTrainDarkSpellType, $DarkSpellTrain)
cmbTrainDarkSpellType()


;Attack bottom th type
_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, $BottomTHType)


;Snipe While Train
If $iChkSnipeWhileTrain = 1 Then
    GUICtrlSetState($chkSnipeWhileTrain, $GUI_CHECKED)
	GUICtrlSetState($txtSearchlimit, $GUI_ENABLE)
	chkSnipeWhileTrain()
Else
    GUICtrlSetState($chkSnipeWhileTrain, $GUI_UNCHECKED)
    chkSnipeWhileTrain()
EndIf

GUICtrlSetData($txtSearchlimit, $itxtSearchlimit)

chkSnipeModeAdd()


;Th Snipe attack type
_GUICtrlComboBox_SetCurSel($cmbAttackTHType, $AttackTHType)


;DE Smart Drills Zap
If $ichkSmartLightSpell = 1 Then
    GUICtrlSetState($chkSmartLightSpell, $GUI_CHECKED)
Else
    GUICtrlSetState($chkSmartLightSpell, $GUI_UNCHECKED)
EndIf
SmartLightSpell()


;Halt on Dark Conditions
_GUICtrlComboBox_SetCurSel($cmbBotCond, $icmbBotCond)


EndFunc