#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:   The Master

    Script Function: TH Snipe GUI
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------



GUISwitch($frmBot, $tabAttackAdv)

;;;;;;;;;;;;;;;;;Rearange Tab;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GUICtrlSetPos ($grpAtkOptions,Default,Default,145,Default)
GUICtrlSetPos ($chkAttackNow,15,145,Default,Default)
GUICtrlSetPos ($lblAttackNow,10,168,Default,Default)
GUICtrlSetPos ($cmbAttackNowDelay,40,166,Default,Default)
GUICtrlSetData($lblAttackNowSec,"Sec. delay")
GUICtrlSetPos ($lblAttackNowSec,80,168,-1,-1)
GUICtrlSetPos ($chkAttackTH,15,185,Default,Default)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Local $x = 20, $y = 250
GUICtrlSetPos ($grpAtkCombos,10,230,225,105)

GUICtrlSetPos ($chkBullyMode,$x,$y,Default,Default)
GUICtrlSetPos ($txtATBullyMode,$x + 95,$y,Default,Default)
GUICtrlSetPos ($lblATBullyMode,$x + 135,$y + 5,Default,Default)
$y +=22
GUICtrlSetPos ($lblATBullyMode2,$x + 10,$y + 3,Default,Default)
GUICtrlSetPos ($cmbYourTH,$x + 95,$y,Default,Default)

GUICtrlSetPos ($IbIBullyMode3,$x + 10,$y + 22,Default,Default)
$y += 36
GUICtrlSetPos ($radUseDBAttack,$x + 20,$y,Default,Default)
GUICtrlSetPos ($radUseLBAttack,$x + 115,$y,Default,Default)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Local $x = 30, $y = 355
$grpSnipeTH = GUICtrlCreateGroup("Snipe TH outside", $x - 20, $y - 20, 225, 170)

;Bottom TH GUI
Local $x = 30, $y = 400

	$lblAttackBottomType = GUICtrlCreateLabel("Attack Bottom base", $x -15 , $y + 5, -1, 17, $SS_LEFT)
    $cmbAttackbottomType = GUICtrlCreateCombo("",  $x + 80, $y, 120, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1:MaxZoomed|2:ModerateZoomed|3:SideAttack|4:MaxZoomed2|5:OriginalMaxZoom", "3:SideAttack")
	GUICtrlSetOnEvent(-1, "cmbAttackbottomType")
	GUICtrlSetState(-1, $GUI_DISABLE)

;Trapped Th GUI
Local $x = 30, $y = 425
	$lblDetectTrapedTH = GUICtrlCreateLabel("Detect Traped Th", $x -15 , $y + 5, -1, 17, $SS_LEFT)
    $cmbDetectTrapedTH = GUICtrlCreateCombo("",  $x + 80, $y, 120, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "1:Dont Detect|2:Attack All In|3:Skip base", "1:Dont Detect")
	GUICtrlSetOnEvent(-1, "cmbDetectTrapedTH")
	GUICtrlSetState(-1, $GUI_DISABLE)

;Use Spells
$chkUseSpellsTH = GUICtrlCreateCheckbox("Use Spells TH", $x -15 , $y + 25, -1, -1)
		$txtTip = "Make the bot Use spells when Attacking TH Outside"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "chkUseSpellsTH")
		GUICtrlSetState(-1, $GUI_DISABLE)

; Snipe Only button
	$y = 427
	$btnSnipeOnlyMode = GUICtrlCreateButton ("Snipe Only Mode", $x+80, $y+30, 90,30)
		$txtTip = "Changes Your Settings so that the bot will only snipe Th ouside with no other attack types"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetOnEvent(-1, "ChangeSettingsSnipeOnly")

GUICtrlCreateGroup("", -99, -99, 1, 1)

;Snip While Train GUI
Local $x = 170, $y = 143
$grpAttackfeatures = GUICtrlCreateGroup("Attack features", $x - 12, $y - 13, 150, 100)
    $chkSnipeWhileTrain = GUICtrlCreateCheckbox("TH Snipe While Train", $x , $y, -1, -1)
	GUICtrlSetTip(-1, "Bot will try to TH snipe while training army.")
	GUICtrlSetOnEvent(-1, "chkSnipeWhileTrain")
    $lblSearchlimit = GUICtrlCreateLabel("Search Limit :", $x , $y +23 , -1, -1)
    GUICtrlSetTip(-1, "The Max Number of bases to search in TH snipe while training army")
    $txtSearchlimit = GUICtrlCreateInput("15", $x + 80, $y + 21, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
    GUICtrlSetLimit(-1, 2)
	GUICtrlSetOnEvent(-1, "txtSearchlimit")
    GUICtrlSetState(-1, $GUI_DISABLE)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

Func cmbDetectTrapedTH()
IniWrite($config, "advanced", "DetectTrapedTH", _GUICtrlComboBox_GetCurSel($cmbDetectTrapedTH))
EndFunc


Func cmbAttackbottomType()
IniWrite($config, "advanced", "BottomTHType", _GUICtrlComboBox_GetCurSel($cmbAttackbottomType))
EndFunc

Func chkSnipeWhileTrain()

If GUICtrlRead($chkSnipeWhileTrain) = $GUI_CHECKED Then
	GUICtrlSetState($txtSearchlimit, $GUI_ENABLE)
	$iChkSnipeWhileTrain = 1
	SetTroopsTh()
Else
	GUICtrlSetState($txtSearchlimit, $GUI_DISABLE)
	$iChkSnipeWhileTrain = 0
	RevertTroopsNormal()
EndIf
IniWrite($config, "advanced", "chkSnipeWhileTrain",$iChkSnipeWhileTrain)
EndFunc ;====>chkSnipeWhileTrain


Func txtSearchlimit()
$itxtSearchlimit = GUICtrlRead($txtSearchlimit)
IniWrite($config, "advanced", "txtSearchlimit", $itxtSearchlimit)
EndFunc


GUICtrlSetOnEvent($chkTrophyMode, "chkSnipeModeAdd")

Func chkSnipeModeAdd()

If GUICtrlRead($chkTrophyMode) = $GUI_CHECKED Then
	GUICtrlSetState($cmbAttackbottomType, $GUI_ENABLE)
	GUICtrlSetState($cmbDetectTrapedTH, $GUI_ENABLE)
	GUICtrlSetState($chkUseSpellsTH, $GUI_ENABLE)
	$OptTrophyMode = 1
	SetTroopsTh()
Else
	GUICtrlSetState($cmbAttackbottomType, $GUI_DISABLE)
	GUICtrlSetState($cmbDetectTrapedTH, $GUI_DISABLE)
	GUICtrlSetState($chkUseSpellsTH, $GUI_DISABLE)
	$OptTrophyMode = 0
    RevertTroopsNormal()
EndIf
chkSnipeMode()
EndFunc

Func chkUseSpellsTH()

If GUICtrlRead($chkUseSpellsTH) = $GUI_CHECKED Then
	$ichkUseSpellsTH = 1
Else
	$ichkUseSpellsTH = 0
EndIf
IniWrite($config, "advanced", "chkUseSpellsTH",$ichkUseSpellsTH)

EndFunc

Func ChangeSettingsSnipeOnly()

GUICtrlSetData ( $txtDBMinGold,"999999" )
GUICtrlSetData ( $txtDBMinElixir, "999999" )
GUICtrlSetData ( $txtABMinGold, "999999" )
GUICtrlSetData ( $txtABMinElixir, "999999" )
GUICtrlSetState($chkTrophyMode, $GUI_CHECKED)
chkSnipeModeAdd()
GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, "0")
_GUICtrlComboBox_SetCurSel($cmbABMeetGE, "0")
cmbDBGoldElixir()
cmbABGoldElixir()
SetLog("Your settings have been changed to Snipe only mode")
EndFunc
