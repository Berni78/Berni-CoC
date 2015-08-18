#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: Train any Spell
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Local $x = 257,  $y = 425

GUISwitch($frmBot, $tabAttackAdv)

$grpTrainSpell = GUICtrlCreateGroup("Spells Training", $x - 20, $y - 20, 223, 100)
	$chkTrainSpells = GUICtrlCreateCheckbox("Create Spells", $x-15 , $y-5, -1, -1)
	GUICtrlSetTip(-1, "Bot will Create Spells")
	GUICtrlSetOnEvent(-1, "chkTrainSpells")
	$y += 13
	$SpellFactoryIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 62, $x-18, $y, 21, 21)
	$lblTrainNormalSpell = GUICtrlCreateLabel("Normal Spell", $x -3 , $y + 5, -1, 17, $SS_RIGHT)
    $cmbTrainNormalSpellType = GUICtrlCreateCombo("",  $x +65, $y, 90, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "None|1:Lightning|2:heal|3:Rage|4:Jump|5:Freeze", "None")
	GUICtrlSetOnEvent(-1, "cmbTrainNormalSpellType")
	GUICtrlSetState(-1, $GUI_DISABLE)
	$LightningIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 36, $x + 160, $y-9, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$HealIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 31, $x + 160, $y-9, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$RageIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 42, $x + 160, $y-9, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$JumpIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 33, $x + 160, $y-9, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$FreezeIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 17, $x + 160, $y-9, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$y += 35
	$DarkSpellFactoryIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 85, $x-18, $y, 21, 21)
	$lblTrainDarkSpell = GUICtrlCreateLabel("Dark E Spell", $x -3 , $y + 5, -1, 17, $SS_RIGHT)
	$cmbTrainDarkSpellType = GUICtrlCreateCombo("",  $x +65, $y, 90, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "None|1:Poison|2:Earthquake|3:haste", "None")
	GUICtrlSetOnEvent(-1, "cmbTrainDarkSpellType")
	GUICtrlSetState(-1, $GUI_DISABLE)
	$PoisonIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 88, $x + 160, $y-7, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$EarthquakeIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 86, $x + 160, $y-7, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
	$HasteIcon = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 87, $x + 160, $y-7, 35, 35)
	GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")


Func ShowNormalSpellIcon()
GUICtrlSetState($LightningIcon, $GUI_HIDE)
GUICtrlSetState($HealIcon, $GUI_HIDE)
GUICtrlSetState($RageIcon, $GUI_HIDE)
GUICtrlSetState($JumpIcon, $GUI_HIDE)
GUICtrlSetState($FreezeIcon, $GUI_HIDE)

local $IconNum = _GUICtrlComboBox_GetCurSel($cmbTrainNormalSpellType)
Switch $IconNum
	Case 1
		GUICtrlSetState($LightningIcon, $GUI_SHOW)
	Case 2
		GUICtrlSetState($HealIcon, $GUI_SHOW)
	Case 3
		GUICtrlSetState($RageIcon, $GUI_SHOW)
	Case 4
		GUICtrlSetState($JumpIcon, $GUI_SHOW)
	Case 5
		GUICtrlSetState($FreezeIcon, $GUI_SHOW)
EndSwitch

EndFunc

Func ShowDarkSpellIcon()
GUICtrlSetState($PoisonIcon, $GUI_HIDE)
GUICtrlSetState($EarthquakeIcon, $GUI_HIDE)
GUICtrlSetState($HasteIcon, $GUI_HIDE)

local $IconNum = _GUICtrlComboBox_GetCurSel($cmbTrainDarkSpellType)
Switch $IconNum
	Case 1
		GUICtrlSetState($PoisonIcon, $GUI_SHOW)
	Case 2
		GUICtrlSetState($EarthquakeIcon, $GUI_SHOW)
	Case 3
		GUICtrlSetState($HasteIcon, $GUI_SHOW)
EndSwitch


EndFunc


Func cmbTrainNormalSpellType()
    IniWrite($config, "advanced", "cmbTrainNormalSpellType", _GUICtrlComboBox_GetCurSel($cmbTrainNormalSpellType))
	ShowNormalSpellIcon()
EndFunc

Func cmbTrainDarkSpellType()
    IniWrite($config, "advanced", "cmbTrainDarkSpellType", _GUICtrlComboBox_GetCurSel($cmbTrainDarkSpellType))
	ShowDarkSpellIcon()
EndFunc

Func chkTrainSpells()

If GUICtrlRead($chkTrainSpells) = $GUI_CHECKED Then
	GUICtrlSetState($cmbTrainNormalSpellType, $GUI_ENABLE)
	GUICtrlSetState($cmbTrainDarkSpellType, $GUI_ENABLE)
	$ichkTrainSpells = 1
Else
	GUICtrlSetState($cmbTrainNormalSpellType, $GUI_DISABLE)
	GUICtrlSetState($cmbTrainDarkSpellType, $GUI_DISABLE)
	$ichkTrainSpells = 0
EndIf
    IniWrite($config, "advanced", "chkTrainSpells", $ichkTrainSpells)
EndFunc


Func TrainSpells()

If $ichkTrainSpells = 1 Then
TrainNormalSpells()
TrainDarkSpells()
EndIf

EndFunc

Func TrainNormalSpells()
Local $Count
Local $SpellPos
local $spellName
Local $lightning [2] = [250,"Lightning"] , $heal [2] = [357,"Heal"] , $Rage [2] = [464,"Rage"] , $Jump [2] = [571,"Jump"] , $Freeze [2] = [678,"Freeze"]


Switch (_GUICtrlComboBox_GetCurSel($cmbTrainNormalSpellType) + 1)

	Case 1
		Return
	Case 2
		$SpellPos = $lightning [0]
		$spellName = $lightning [1]
    Case 3
		$SpellPos = $heal [0]
		$spellName = $heal [1]
	Case 4
		$SpellPos = $Rage [0]
		$spellName = $Rage [1]
	Case 5
		$SpellPos = $Jump [0]
		$spellName = $Jump [1]
	Case 6
		$SpellPos = $Freeze [0]
		$spellName = $Freeze [1]

EndSwitch

SetLog("Creating Normal Spells...")

If $numFactorySpellAvaiables = 1 Then PureClick($btnpos[7][0], $btnpos[7][1])
If _sleep(500) Then Return

$Count = 0
While Not (isSpellFactory())
	_TrainMoveBtn(-1) ;click prev button
	$Count += 1
	If _sleep(500) Then Return
	If $Count >= 7 Then ExitLoop
WEnd

If isSpellFactory() Then
    $count = 0
	While 1

		If $debugSetlog = 1 Then SetLog(_GetPixelColor($SpellPos, 375, True))

		If _ColorCheck(_GetPixelColor(250, 375, True), Hex(0x7A7A7A, 6), 20) Then
					SetLog("Spell Factory Full", $COLOR_RED)
					ExitLoop
		EndIf

        If _ColorCheck(_GetPixelColor($SpellPos, 375, True), Hex(0xC945C1, 6), 20) = False Then
					SetLog("Spell isn't avaliable", $COLOR_RED)
					ExitLoop
		EndIf

		If _sleep(500) Then Return

		GemClick($SpellPos,375,1,600,"#0260")
		$Count += 1
		If $count = 5 Then ExitLoop

	WEnd
	If $count <> 0 Then
		SetLog("Created " & $count & " " & $spellName &" Spell(s)", $COLOR_BLUE)
	EndIf

Else
	SetLog("Spell Factory is not available, Skip Create", $COLOR_RED)
EndIf

EndFunc ; End Spell Factory Train Spells

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func TrainDarkSpells()
Local $Count
Local $SpellPos
local $spellName
Local $Poison [2] = [250,"Poison"] , $Earthquake [2] = [357,"Earthquake"] , $haste [2] = [464,"Haste"]

Switch (_GUICtrlComboBox_GetCurSel($cmbTrainDarkSpellType) + 1)

	Case 1
		Return
	Case 2
		$SpellPos = $Poison [0]
		$spellName = $Poison [1]
    Case 3
		$SpellPos = $Earthquake [0]
		$spellName = $Earthquake [1]
	Case 4
		$SpellPos = $haste [0]
		$spellName = $haste [1]

EndSwitch


SetLog("Creating Dark Spells...")

If $numFactoryDarkSpellAvaiables = 1 Then PureClick($btnpos[8][0], $btnpos[8][1])
If _sleep(500) Then Return

$Count = 0
While Not (isDarkSpellFactory())
	_TrainMoveBtn(-1) ;click prev button
	$Count += 1
	If _sleep(500) Then Return
	If $Count >= 7 Then ExitLoop
WEnd


If isDarkSpellFactory() Then
    $count = 0
    While 1
		If _sleep(500) Then Return

        If $debugSetlog = 1 Then SetLog(_GetPixelColor($SpellPos, 375, True))

		If _ColorCheck(_GetPixelColor(250, 375, True), Hex(0x292929, 6), 10) Then
					SetLog("Dark Spell Factory Full", $COLOR_RED)
					ExitLoop
		EndIf

		If _ColorCheck(_GetPixelColor($SpellPos, 375, True), Hex(0x302238, 6), 20) = False Then
					SetLog("Dark Spell isn't avaliable", $COLOR_RED)
					ExitLoop
		EndIf

		GemClick($SpellPos, 375, 1, 20, "#0290")
		$Count += 1
		If $count = 11 Then ExitLoop

    WEnd
    If $count <> 0 Then
	SetLog("Created " & $count & " " &  $spellName & " Dark Spell(s)", $COLOR_BLUE)
    EndIf

Else
	setlog("Dark Spell Factory is not available, Skip Create", $COLOR_RED)
EndIf

EndFunc ; End Dark Spell Factory Train Spells