#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: Control GUI For remote addition of mods
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------


local $x = 170 , $y = 182
GUISwitch($frmBot, $tabAttackAdv)
$chkSmartLightSpell =  GUICtrlCreateCheckbox("Smart Drills Zap", $x, $y+2, -1, -1)
			$txtTip = "Check this to drop lightning spells on de drills"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SmartLightSpell")
$lblMinDark = GUICtrlCreateLabel("Min. Dark Elixir :", $x , $y+25, -1, 17, $SS_LEFT)
$txtMinDark = GUICtrlCreateInput("1000", $x+80, $y+23, 40, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
    GUICtrlSetLimit(-1, 4)
	GUICtrlSetOnEvent(-1, "txtMinDark")
    GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateTabItem("")

Func txtMinDark()
$itxtMinDark = GUICtrlRead($txtMinDark)
IniWrite($config, "advanced", "txtMinDark", $itxtMinDark)
EndFunc

Func SmartLightSpell()
	If GUICtrlRead($chkSmartLightSpell) = $GUI_CHECKED Then
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		$ichkSmartLightSpell = 1
	Else
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		$ichkSmartLightSpell = 0
	EndIf
IniWrite($config, "advanced", "SmartLightSpell",$ichkSmartLightSpell)
EndFunc   ;==>GUILightSpell

Func UpZapStates()
; DE Smart Zap
	GUICtrlSetData($lblSmartZap, _NumberFormat($smartZapGain))
    GUICtrlSetData($lblLightningUsed, _NumberFormat($NumLTSpellsUsed))
EndFunc
