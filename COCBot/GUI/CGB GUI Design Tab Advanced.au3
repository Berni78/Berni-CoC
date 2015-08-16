; #FUNCTION# ====================================================================================================================
; Name ..........: CGB GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: DkEd, Hervidero (2015)
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ Attack Advanced Tab
;~ -------------------------------------------------------------
 $tabAttackAdv = GUICtrlCreateTabItem("Attack Adv.")
	Local $x = 30, $y = 150
	$grpAtkOptions = GUICtrlCreateGroup("Attack Options", $x - 20, $y - 20, 450, 115)
		$chkAttackNow = GUICtrlCreateCheckbox("Attack Now! option.", $x, $y, -1, -1)
			$txtTip = "Check this if you want the option to have an 'Attack Now!' button next to" & @CRLF & _
				"the Start and Pause buttons to bypass the dead base or all base search values." & @CRLF & _
				"The Attack Now! button will only appear when searching for villages to Attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkAttackNow")
		$y +=22
		$lblAttackNow = GUICtrlCreateLabel("Add:", $x + 20, $y + 4, -1, -1, $SS_RIGHT)
			$txtTip = "Add this amount of reaction time to slow down the search."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$cmbAttackNowDelay = GUICtrlCreateCombo("", $x + 50, $y + 1, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "5|4|3|2|1","3") ; default value 3
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblAttackNowSec = GUICtrlCreateLabel("sec. of reaction time.", $x + 90, $y + 4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y +=22
		$chkAttackTH = GUICtrlCreateCheckbox("Attack Townhall Outside", $x, $y, -1, -1)
			GUICtrlSetTip(-1, "Check this to Attack an exposed Townhall first. (Townhall outside of Walls)" & @CRLF & "TIP: Also tick 'Meet Townhall Outside' on the Search tab if you only want to search for bases with exposed Townhalls.")
	    $y +=27
		$chkSnipeWhileTrain = GUICtrlCreateCheckbox("TH snipe while training army", $x, $y, -1, -1) ; Snipe While Train MOD by ChiefM3
            GUICtrlSetTip(-1, "Bot will try to TH snipe while training army.")
;            $y +=22
	    $chkSmartLightSpell =  GUICtrlCreateCheckbox("Smart Zap", 260, 150, -1, -1)
			$txtTip = "Check this to drop lightning spells on de drills"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SmartLightSpell")

             $chkSpellNone = GUICtrlCreateCheckbox("Use Spell:", 260, 175, -1, -1)
		$txtTip = "Spells for use with TH Sniping using Gbarch"
		GUICtrlSetTip(-1, $txtTip)
		GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlSetOnEvent(-1, "chkSpellNone")

		$cmbTHSpellType = GUICtrlCreateCombo("", 330, 175, 85, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "Lighting|Healing|Rage", "Healing")

                $lblAttackBottomType = GUICtrlCreateLabel("TH Bottom base", 238 , 210, -1, 17, $SS_RIGHT)
		$cmbAttackbottomType = GUICtrlCreateCombo("",  330, 205, 95, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "DontAttack|1:MaxZoomed|2:ModerateZoomed|3:SideAttack", "DontAttack")

;		$y +=22
;		$chkLightSpell = GUICtrlCreateCheckbox("Hit Dark Elixir storage with Lightning Spell", $x, $y, -1, -1)
;			GUICtrlSetTip(-1, "Check this if you want to use lightning spells to steal Dark Elixir when bot meet Minimum Dark Elixir.")
;			GUICtrlSetOnEvent(-1, "GUILightSpell")
;		$y +=22
;  		$lbliLSpellQ = GUICtrlCreateLabel("Have:", $x + 20, $y + 4, -1, -1)
;			$txtTip = "Set the minimum amount of spells needed. Never attack with less."
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$cmbiLSpellQ = GUICtrlCreateCombo("", $x + 50, $y + 1, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			GUICtrlSetData(-1, "1|2|3|4|5", "3")
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$lbliLSpellQ2 = GUICtrlCreateLabel("Lightning Spells ready before using this type of Attack.", $x + 90, $y + 4, -1, -1)
;			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 270
	$grpAtkCombos = GUICtrlCreateGroup("Advanced Attack Combo's", $x - 20, $y - 20, 225, 165)
		$chkBullyMode = GUICtrlCreateCheckbox("TH Bully.  After:", $x, $y, -1, -1)
			$txtTip = "Adds the TH Bully combo to the current search settings. (Example: Deadbase OR TH Bully)" & @CRLF & _
				"TH Bully: Attacks a lower townhall level after the specified No. of searches."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkBullyMode")
		$txtATBullyMode = GUICtrlCreateInput("150", $x + 95, $y, 35, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "TH Bully: No. of searches to wait before activating."
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblATBullyMode = GUICtrlCreateLabel("search(es).", $x + 135, $y + 5, -1, -1)
		$y +=25
		$lblATBullyMode = GUICtrlCreateLabel("Max TH level:", $x + 10, $y + 3, -1, -1, $SS_RIGHT)
		$cmbYourTH = GUICtrlCreateCombo("", $x + 95, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "TH Bully: Max. Townhall level to bully."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 24
		GUICtrlCreateLabel("When found, Attack with settings from:", $x + 10, $y, -1, -1, $SS_RIGHT)
		$y += 14
		$radUseDBAttack = GUICtrlCreateRadio("DeadBase Atk.", $x + 20, $y, -1, -1)
			GUICtrlSetTip(-1, "Use Dead Base attack settings when attacking a TH Bully match.")
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$radUseLBAttack = GUICtrlCreateRadio("LiveBase Atk.", $x + 115, $y, -1, -1)
			GUICtrlSetTip(-1, "Use Live Base attack settings when attacking a TH Bully match.")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y += 27
		$chkTrophyMode = GUICtrlCreateCheckbox("TH Snipe. Add:", $x, $y, -1, -1)
			$txtTip = "Adds the TH Snipe combination to the current search settings. (Example: Deadbase OR TH Snipe)"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkSnipeMode")
		$lblTHaddtiles = GUICtrlCreateLabel( "tile(s).", $x + 135, $y + 5, -1, 17)
		$txtTHaddtiles = GUICtrlCreateInput("1", $x + 95, $y, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$y+=25
		$lblAttackTHType = GUICtrlCreateLabel("Attack Type:", $x + 10 , $y + 5, -1, 17, $SS_RIGHT)
		$cmbAttackTHType = GUICtrlCreateCombo("",  $x + 95, $y, 105, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "Barch|Attack1:Normal|Attack2:eXtreme|Attack3:GBarch|Attack4:Wizards|Attack5:Dragons|Attack6:SmartBarch|Attack7:MasterGiBaM", "Attack1:Normal")
			GUICtrlSetState(-1, $GUI_DISABLE)
    GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 260, $y = 270
	$grpDefenseFarming = GUICtrlCreateGroup("Defense Farming", $x - 20, $y - 20, 220, 165)
		$chkUnbreakable = GUICtrlCreateCheckbox("Enable Unbreakable Mode", $x, $y, -1, -1)
			$TxtTip = "Enable farming Defense Wins for Unbreakable achievement." ;& @CRLF & "TIP: Set your trophy range on the Misc Tab to '600 - 800' for best results. WARNING: Doing so will DROP you Trophies!"
			GUICtrlSetTip(-1, $TxtTip)
			GUICtrlSetOnEvent(-1, "chkUnbreakable")
		$y += 23
		$lblUnbreakable1 = GUICtrlCreateLabel("Wait Time:", $x + 20 , $y + 3, -1, -1, $SS_RIGHT)
		$txtUnbreakable = GUICtrlCreateInput("5", $x + 80, $y, 30, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$TxtTip = "Set the amount of time to stop CoC and wait for enemy attacks to gain defense wins. (1-99 minutes)"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblUnbreakable2 = GUICtrlCreateLabel("Minutes", $x + 113, $y+3, -1, -1)
		$y += 28
		$lblUnBreakableFarm = GUICtrlCreateLabel("Farm Min.", $x + 25 , $y, -1, -1)
		$lblUnBreakableSave = GUICtrlCreateLabel("Save Min.", $x + 115 , $y, -1, -1)
		$y += 16
		$txtUnBrkMinGold = GUICtrlCreateInput("50000", $x + 20, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Amount of Gold that stops Defense farming, switches to normal farming if below." & @CRLF & "Set this value to amount of Gold you need for searching or upgrades.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 80, $y + 2, 16, 16)
		$txtUnBrkMaxGold = GUICtrlCreateInput("600000", $x + 110, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Amount of Gold in Storage Required to Enable Defense Farming." & @CRLF & "Input amount of Gold you need to attract enemy or for upgrades.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 170, $y + 2, 16, 16)
		$y += 26
		$txtUnBrkMinElixir = GUICtrlCreateInput("50000", $x + 20, $y, 58, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Amount of Elixir that stops Defense farming, switches to normal farming if below." & @CRLF & "Set this value to amount of Elixir you need for making troops or upgrades.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 80, $y, 16, 16)
		$txtUnBrkMaxElixir = GUICtrlCreateInput("600000", $x + 110, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Amount of Elixir in Storage Required to Enable Defense Farming." & @CRLF & "Input amount of Elixir you need to attract enemy or for upgrades.")
			GUICtrlSetLimit(-1, 7)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 170, $y, 16, 16)
		$y += 24
		$txtUnBrkMinDark = GUICtrlCreateInput("5000", $x + 20, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Amount of Dark Elixir that stops Defense farming, switches to normal farming if below." & @CRLF & "Set this value to amount of Dark Elixir you need for making troops or upgrades.")
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 80, $y, 16, 16)
		$txtUnBrkMaxDark = GUICtrlCreateInput("6000", $x + 110, $y, 58, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, "Amount of Dark Elixir in Storage Required to Enable Defense Farming." & @CRLF & "Input amount of Dark Elixir you need to attract enemy or for upgrades.")
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 170, $y, 16, 16)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;
    ;;; Toolbox
    ;;;;;;;;;;;;;;;;;
       Local $x = 30, $y = 435
    $grpToolboxOptions = GUICtrlCreateGroup("Toolbox", $x - 20, $y - 20, 225, 90)
        $chkToolboxModeBot = GUICtrlCreateCheckbox("Mode: Bot", $x, $y, 95, 20, $BS_PUSHLIKE)
            $txtTip = "Check this if you want activate the Attack Toolbox during normal bot's attacks." & @CRLF & _
                "WARNING: using the toolbox/hotkeys could screw the normal bot's attack behavior." & @CRLF & _
                "The Toolbox should deactivate the hotkeys once the attack is finished and the bot take the screenshot." & @CRLF & _
                "   Use with care."
            GUICtrlSetTip(-1, $txtTip)
            GUICtrlSetOnEvent(-1, "chkToolboxModeBot")
        $y +=22
        $chkToolboxModeSearch = GUICtrlCreateCheckbox("Mode: Search", $x, $y, 95, 20, $BS_PUSHLIKE)
            $txtTip = "Check this if you want activate the Attack Toolbox when a base is found through Search Mode." & @CRLF & _
                "This is be the 'normal' Toolbox usage. Search a base and use your mouse/keyboard to manually attack." & @CRLF & _
                "The Toolbox should deactivate the hotkeys once the attack is done." & @CRLF & _
                "   Enjoy it!"
            GUICtrlSetTip(-1, $txtTip)
            GUICtrlSetOnEvent(-1, "chkToolboxModeSearch")
			$x = 30 + 95
        $y = 430
        $chkToolboxModeWar = GUICtrlCreateCheckbox("Mode: War", $x, $y+5, 95, 42, $BS_PUSHLIKE)
            $txtTip = "Check this if you want to keep the toolbox always active. Usefull for Wars probably." & @CRLF & _
                "WARNING: when the hotkeys are active, you won't be able to use these keys on other applications!." & @CRLF & _
                "The Toolbox will never deactivate the hotkeys. It's a responsability of yours." & @CRLF & _
                "   Remeber, it's not my fault."
            GUICtrlSetTip(-1, $txtTip)
            GUICtrlSetFont(-1, 10, -1, -1, "Bad Blockhead")
            GUICtrlSetOnEvent(-1, "chkToolboxModeWar")
        $x = 28
        $y = 430 + 22 + 22
        ;$chkToolBoxDetach = GUICtrlCreateCheckbox("Integrate", $x, $y, 95, 20, $BS_PUSHLIKE)
        $chkToolboxDetach = GUICtrlCreateCheckbox("Attached", $x, $y +5, 95, 20, $BS_PUSHLIKE)
            $txtTip = "Attach/Detach the Attack Toolbox from the bot window, into its own movable toolbox-window."
            GUICtrlSetTip(-1, $txtTip)
            GUICtrlSetOnEvent(-1, "chkToolboxDetach")
        $x = 30 + 95
        $y = $y
        ;$chkToolBoxSavePos = GUICtrlCreateCheckbox("Save Position", $x, $y, 95, 20, $BS_PUSHLIKE)
        $chkToolboxSavePos = GUICtrlCreateCheckbox("Save Position", $x + 2, $y +5, 95, 20)
            $txtTip = "Restore toolbox-window position instead of placing it at the top everytime."
            GUICtrlSetTip(-1, $txtTip)
            GUICtrlSetOnEvent(-1, "chkToolboxSavePos")
    GUICtrlCreateGroup("", -99, -99, 1, 1)
         Local $x = 260, $y = 435
		 $grpSwitchD = GUICtrlCreateGroup("Account Switch And Donate Options", $x - 20, $y - 20, 220, 90)
		 $chkSwitchD = GUICtrlCreateCheckbox("Switch Account && Donate", $x, $y, -1, -1)
		   $txtTip = "Will Switch  account and  Donate  Then Switchh back"
			GUICtrlSetTip(-1, $txtTip)
	  GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
