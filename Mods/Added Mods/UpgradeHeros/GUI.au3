

GUICtrlSetPos ($Laboratory,Default,Default,235,70)
GUICtrlSetPos ($chkLab,Default,145,Default,Default)
GUICtrlSetPos ($lblNextUpgrade,70,170,Default,Default)
GUICtrlSetPos ($cmbLaboratory,115,170,Default,Default)
GUICtrlDelete ($icnLabUpgrade)

GUISwitch($frmBot, $tabUpgrades)

Local $x = 267, $y = 150
		$Heroes = GUICtrlCreateGroup("Heroes", $x - 20, $y - 20, 212, 70)
		$chkUpgradeKing = GUICtrlCreateCheckbox("Upgrade King", $x - 10, $y-5, -1, -1)
			$txtTip = "Check box to enable continuously upgrade King when you have enough DE" & @CRLF & "You Can Manually locate your heros at misc tab"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "ichkUpgradeKing")
		$chkUpgradeQueen = GUICtrlCreateCheckbox("Upgrade Queen", $x - 10, $y+20, -1, -1)
			$txtTip = "Check box to enable continuously upgrade Queen when you have enough DE" & @CRLF & "You Can Manually locate your heros at misc tab"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "ichkUpgradeQueen")
		GUICtrlCreateIcon(@ScriptDir&"\Mods\images\Icons\King.ico",-1,$x+90,$y-5,45,45)
		GUICtrlCreateIcon(@ScriptDir&"\Mods\images\Icons\Queen.ico",-1,$x+141,$y-5,45,45)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

GUISwitch($frmBot, $tabMisc)
Local $x = 30, $y = 460
		$btnLocateKing = GUICtrlCreateButton("Locate King", $x + 230, $y, 40, 40, $BS_ICON)
			GUICtrlSetImage(-1, @ScriptDir&"\Mods\images\Icons\Barbarian King Altar.ico",-1)
			$txtTip = "Locate King."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "LocateKingAltar")

		$btnLocateQueen = GUICtrlCreateButton("Locate Queen", $x + 270, $y, 40, 40, $BS_ICON)
			GUICtrlSetImage(-1, @ScriptDir&"\Mods\images\Icons\Archer Queen Altar.ico",-1)
			$txtTip = "Locate Queen."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "LocateQueenAltar")
GUICtrlCreateTabItem("")


Func ichkUpgradeKing()
	If GUICtrlRead($chkUpgradeKing) = $GUI_CHECKED Then
		$ichkUpgradeKing = 1
	Else
		$ichkUpgradeKing = 0
	EndIf
	IniWrite($config, "upgrade", "UpgradeKing",$ichkUpgradeKing)
EndFunc

Func ichkUpgradeQueen()
	If GUICtrlRead($chkUpgradeQueen) = $GUI_CHECKED Then
		$ichkUpgradeQueen = 1
	Else
		$ichkUpgradeQueen = 0
	EndIf
	IniWrite($config, "upgrade", "UpgradeQueen",$ichkUpgradeQueen)
EndFunc

