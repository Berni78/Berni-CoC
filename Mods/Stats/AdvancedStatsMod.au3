; #FUNCTION# ====================================================================================================================
; Name ..........: CGB GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: The Master
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
$LastCtrlToDisableMod = GUICtrlCreateDummy()
;~ -------------------------------------------------------------
;~ Stats Tab
;~ -------------------------------------------------------------
#include <FontConstants.au3>

GUICtrlDelete ( $tabStats )

; _GUICtrlTab_InsertItem($tabMain, 12, "Stats")

$tabStats = GUICtrlCreateTabItem("Stats")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Local $x = 29, $y = 145
	$grpResourceOnStart = GUICtrlCreateGroup("Started with", $x-20, $y - 20,110, 105)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpResourceOnStart), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$lblResultStatsTemp = GUICtrlCreateLabel("Starting" & @CRLF & "Report" & @CRLF &"will appear" & @CRLF & "here after" & @CRLF & "first run.", $x - 15, $y - 2, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 20
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 52, $y, 16, 16)
		$lblResultGoldStart = GUICtrlCreateLabel("", $x-45, $y, 95, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Gold you had when the bot started."
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 52, $y, 16, 16)
		$lblResultElixirStart = GUICtrlCreateLabel("", $x-45, $y, 95, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Elixir you had when the bot started."
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picResultDEStart = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 52, $y, 16, 16)
		$lblResultDEStart = GUICtrlCreateLabel("", $x-45, $y, 95, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Dark Elixir you had when the bot started."
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 52, $y, 16, 16)
		$lblResultTrophyStart = GUICtrlCreateLabel("", $x-45, $y, 95, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Trophies you had when the bot started."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 29
	$y = 249
	$grpArmyCosts = GUICtrlCreateGroup("Army Costs", $x-20, $y - 20,110, 87)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpArmyCosts), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$lblArmyCostsTemp = GUICtrlCreateLabel("Army cost" & @CRLF & "Updates here" & @CRLF & "After Each" & @CRLF & "Army Train.", $x - 15, $y-5, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 52, $y-5, 16, 16)
		$lblArmyElixirCost = GUICtrlCreateLabel("", $x-45, $y -5, 95, 17, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The Total amount of Elixir your Army cost."
			GUICtrlSetTip(-1, $txtTip)
		$y +=17
		$picArmyDECost = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 52, $y-5, 16, 16)
		$lblArmyDECost = GUICtrlCreateLabel("", $x-45, $y -5, 95, 17, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The Total amount of Dark Elixir your Army cost."
			GUICtrlSetTip(-1, $txtTip)
		$y +=17
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 52, $y-5, 16, 16)
		$lblArmyHourlyECost = GUICtrlCreateLabel("", $x-45, $y -5, 95, 17, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Net Elixir Army cost Per Hour."
			GUICtrlSetTip(-1, $txtTip)
		$y +=17
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 52, $y-5, 16, 16)
		$lblArmyHourlyDECost = GUICtrlCreateLabel("", $x-45, $y -5, 95, 17, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Net Dark Elixir Army cost Per Hour."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 141
    $y = 145
	$grpLastAttack = GUICtrlCreateGroup("Last Attack", $x - 20, $y - 20,105,105)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpLastAttack), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$lblLastAttackTemp = GUICtrlCreateLabel("Last Attack" & @CRLF & "report" & @CRLF & "appears" & @CRLF & "here after" & @CRLF & "each attack.", $x - 15, $y-2, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 15
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 52, $y, 16, 16)
		$lblGoldLastAttackMod = GUICtrlCreateLabel("", $x-35, $y, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Gold you gained on the last attack."
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 52, $y, 16, 16)
		$lblElixirLastAttackMod = GUICtrlCreateLabel("", $x-35, $y, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Elixir you gained on the last attack."
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picDarkLastAttack = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 52, $y, 16, 16)
		$lblDarkLastAttackMod = GUICtrlCreateLabel("", $x-35, $y, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Dark Elixir you gained on the last attack."
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 52, $y, 16, 16)
		$lblTrophyLastAttackMod = GUICtrlCreateLabel("", $x-35, $y, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Trophies you gained or lost on the last attack."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 141
	$y = 249
	$grpLastAttackBouns = GUICtrlCreateGroup("Last Bouns", $x-20, $y - 20,105, 87)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpLastAttackBouns), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$y += 2
		$lblLastAttackBounsTemp = GUICtrlCreateLabel("Last Bouns" & @CRLF & "appears" & @CRLF & "here after" & @CRLF & "each Attack.", $x - 15, $y-5, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 15
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 36, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 52, $y-5, 16, 16)
		$lblBounsGLastAttack = GUICtrlCreateLabel("", $x-35, $y -5, 70, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Bouns Gold you gained last attack."
			GUICtrlSetTip(-1, $txtTip)
		$y +=22
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 36, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 52, $y-5, 16, 16)
		$lblBounsELastAttack = GUICtrlCreateLabel("", $x-35, $y -5, 70, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Bouns Elixir you gained last attack."
			GUICtrlSetTip(-1, $txtTip)
		$y +=22
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 36, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 52, $y-5, 16, 16)
		$lblBounsDELastAttack = GUICtrlCreateLabel("", $x-35, $y -5, 70, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Bouns Dark Elixir you gained last attack."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 248
	$y = 145
    $grpHourlyStats = GUICtrlCreateGroup("Hourly Stats", $x - 20, $y - 20,110, 105)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpHourlyStats), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$lblHourlyStatsTemp = GUICtrlCreateLabel("Hourly" & @CRLF & "Report" & @CRLF & "will update" & @CRLF & "here after" & @CRLF & "each attack.", $x - 15, $y -2, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 27
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 45, $y, 16, 16)
        $lblHourlyStatsGold = GUICtrlCreateLabel("", $x-47, $y, 90, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
        $txtTip = "Net Gold gain per hour"
        GUICtrlSetTip(-1, $txtTip)
        $y +=20
        GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 45, $y, 16, 16)
        $lblHourlyStatsElixir = GUICtrlCreateLabel("", $x-47, $y, 90, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
        $txtTip = "Net Elixir gain per hour"
        GUICtrlSetTip(-1, $txtTip)
        $y +=20
        GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 45, $y, 16, 16)
        $lblHourlyStatsDark = GUICtrlCreateLabel("", $x-47, $y, 90, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
        $txtTip = "Net Dark Elixir gain per hour"
        GUICtrlSetTip(-1, $txtTip)
        $y +=20
        GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 45, $y, 16, 16)
        $lblHourlyStatsTrophy = GUICtrlCreateLabel("", $x-47, $y, 90, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
        $txtTip = "Net Trophy gain per hour"
        GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 248
	$y = 249
	$grpHourlyBouns = GUICtrlCreateGroup("Hourly Bouns", $x-20, $y - 20,110, 87)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpHourlyBouns), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x8B8B00)
		$y += 2
		$lblHourlyBounsTemp = GUICtrlCreateLabel("Hourly" & @CRLF & "Bouns is" & @CRLF & "here after" & @CRLF & "each Attack.", $x - 15, $y-5, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 27
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 30, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 45, $y-5, 16, 16)
		$lblBounsGHourly = GUICtrlCreateLabel("", $x-47, $y -5, 75, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Net Bouns Gold gain per hour"
			GUICtrlSetTip(-1, $txtTip)
		$y +=22
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 30, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 45, $y-5, 16, 16)
		$lblBounsEHourly = GUICtrlCreateLabel("", $x-47, $y -5, 75, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Net Bouns Elixir gain per hour"
			GUICtrlSetTip(-1, $txtTip)
		$y +=22
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 30, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 45, $y-5, 16, 16)
		$lblBounsDEHourly = GUICtrlCreateLabel("", $x-47, $y -5, 75, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Net Bouns Dark Elixir gain per hour"
			GUICtrlSetTip(-1, $txtTip)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 360
    $y = 145
    $grpTotalLoot = GUICtrlCreateGroup("Total Gain", $x-20, $y - 20,120, 105)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpTotalLoot), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$lblTotalLootTempMod = GUICtrlCreateLabel("Total" & @CRLF & "Report" & @CRLF & "will update" & @CRLF & "here after" & @CRLF & "each attack.", $x - 15, $y-2, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 25
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 57, $y, 16, 16)
		$lblGoldLootMod =  GUICtrlCreateLabel("", $x-45, $y, 100, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The total amount of Gold you gained or lost while the Bot is running." & @CRLF & "Total Gold Loot & Bouns - Total Search Cost"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 57, $y, 16, 16)
		$lblElixirLootMod =  GUICtrlCreateLabel("", $x-45, $y, 100, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The total amount of Elixir you gained or lost while the Bot is running." & @CRLF & "Total Elixir Loot & Bouns - Total Amry Elixir Cost"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		$picDarkLoot = GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 57, $y, 16, 16)
        $lblDarkLootMod =  GUICtrlCreateLabel("", $x-45, $y, 100, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The total amount of Dark Elixir you gained or lost while the Bot is running." & @CRLF & "Total Dark Elixir Loot & Bouns - Total Amry Dark Elixir Cost"
			GUICtrlSetTip(-1, $txtTip)
		$y +=20
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x + 57, $y, 16, 16)
		$lblTrophyLootMod = GUICtrlCreateLabel("", $x-45, $y, 100, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Trophies you gained or lost while the Bot is running."
			GUICtrlSetTip(-1, $txtTip)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    $x = 360
	$y = 249
	$grpTotalBouns = GUICtrlCreateGroup("Total Bouns", $x-20, $y - 20,120, 87)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpTotalBouns), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$y += 2
		$lblTotalBounsTemp = GUICtrlCreateLabel("Total Bouns" & @CRLF & "Updates" & @CRLF & "here after" & @CRLF & "each Attack.", $x - 15, $y-5, 80, 80, BITOR($SS_LEFT, $BS_MULTILINE))
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$x += 25
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 41, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 57, $y-5, 16, 16)
		$lblBounsGTotal = GUICtrlCreateLabel("", $x-45, $y -5, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Bouns Gold you gained while the Bot is running."
			GUICtrlSetTip(-1, $txtTip)
		$y +=22
		GUICtrlCreateIcon ($pIconLib, $eIcnElixir, $x + 41, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 57, $y-5, 16, 16)
		$lblBounsETotal = GUICtrlCreateLabel("", $x-45, $y -5, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Bouns Elixir you gained while the Bot is running."
			GUICtrlSetTip(-1, $txtTip)
		$y +=22
		GUICtrlCreateIcon ($pIconLib, $eIcnDark, $x + 41, $y-5, 16, 16)
		GUICtrlCreateIcon ($pIconLib, $eIcnSilverStar, $x + 57, $y-5, 16, 16)
		$lblBounsDETotal = GUICtrlCreateLabel("", $x-45, $y -5, 85, 20, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Bouns Dark Elixir you gained while the Bot is running."
			GUICtrlSetTip(-1, $txtTip)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	$x = 20
	$y = 440
	$grpButtons = GUICtrlCreateGroup("", $x -10, $y - 10 , 150, 65)
	    $btnMoreStats = GUICtrlCreateButton ("More Stats", $x -5, $y, 60,21)
		GUICtrlSetState(-1, $GUI_DISABLE)
		$x += 70
		$btnLoots = GUICtrlCreateButton ("Loots", $x -5, $y, 55,21)
		GUICtrlSetOnEvent(-1, "btnLoots")
		$x -= 70
		$y +=25
	    $btnExportCSV = GUICtrlCreateButton ("Export CSV", $x- 5, $y, 60,21)
		GUICtrlSetState(-1, $GUI_DISABLE)
        $x += 70
        $btnLogs = GUICtrlCreateButton ("Logs", $x -5, $y, 55,21)
        GUICtrlSetOnEvent(-1, "btnLogs")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	$x = 30
	$y = 335
	$grpStatsMisc = GUICtrlCreateGroup("Stats: Misc", $x - 20, $y - 20, 450, 70)
		DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpStatsMisc), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$y -=5
		$x -=5
		GUICtrlCreateIcon ($pIconLib, $eIcnTH1, $x - 10, $y + 7, 24, 24)
		GUICtrlCreateIcon ($pIconLib, $eIcnTH10, $x + 16, $y + 7, 24, 24)
        $lblvillagesattacked = GUICtrlCreateLabel("Attacked:", $x + 45, $y + 2, -1, 17)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
        $lblresultvillagesattacked = GUICtrlCreateLabel("0", $x + 65, $y + 2, 55, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The No. of Villages that were attacked by the Bot."
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
        $lblvillagesskipped = GUICtrlCreateLabel("Skipped:", $x + 45, $y + 2, -1, 17)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
        $lblresultvillagesskipped = GUICtrlCreateLabel("0", $x + 65, $y + 2, 55, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The No. of Villages that were skipped during search by the Bot."
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
		$lblSearchCost = GUICtrlCreateLabel("Search Cost:", $x-10, $y + 2, 80, 17)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		GUICtrlCreateIcon ($pIconLib, $eIcnGold, $x + 120, $y, 16, 16)
	    $lblresultSearchCost = GUICtrlCreateLabel("0", $x + 30, $y + 2, 90, 20, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Total Search Costs while bot is runnig"
			GUICtrlSetTip(-1, $txtTip)
		$x = 180
		$y = 330
		GUICtrlCreateIcon ($pIconLib, $eIcnTrophy, $x, $y, 16, 16)
        $lbltrophiesdropped = GUICtrlCreateLabel("Dropped:", $x + 20, $y + 2, -1, 17)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
        $lblresulttrophiesdropped = GUICtrlCreateLabel("0", $x + 75, $y + 2, 30, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The amount of Trophies dropped by the Bot due to Trophy Settings (on Misc Tab)."
			GUICtrlSetTip(-1, $txtTip)
        $y += 17
        GUICtrlCreateIcon ($pIconLib, $eIcnHourGlass, $x, $y, 16, 16)
        $lblruntime = GUICtrlCreateLabel("Runtime:", $x + 20, $y + 2, -1, 17)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
        $lblresultruntime = GUICtrlCreateLabel("00:00:00", $x + 60, $y + 2, 55, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The total Running Time of the Bot."
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
		$x -= 15
	    $lbloutofsync = GUICtrlCreateLabel("Out Of Sync :", $x + 20, $y + 2, -1, 17)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
	    $lblresultoutofsync = GUICtrlCreateLabel("0", $x + 65, $y + 2, 55, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Restarted after Out of Sync Error:"
			GUICtrlSetTip(-1, $txtTip)
		$x = 320
		$y = 330
		GUICtrlCreateIcon ($pIconLib, $eIcnWall, $x - 7, $y + 7, 24, 24)
        $lblwallbygold = GUICtrlCreateLabel("Upg. by Gold:", $x + 20, $y + 2, -1, 20)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$lblWallgoldmake =  GUICtrlCreateLabel("0", $x + 90, $y + 2, 30, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The No. of Walls upgraded by Gold."
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
		$lblwallbyelixir = GUICtrlCreateLabel("Upg. by Elixir:", $x + 20, $y + 2,80, 20)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$lblWallelixirmake =  GUICtrlCreateLabel("0", $x + 90, $y + 2, 30, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "The No. of Walls upgraded by Elixir."
			GUICtrlSetTip(-1, $txtTip)
		$y += 17
		$lblTHLVL = GUICtrlCreateLabel("TownHall Level", $x + 20, $y + 2,90, 20)
		GUICtrlSetFont(-1, 9, $FW_MEDIUM,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x4F5D8D)
		$lblResultTHLVL =  GUICtrlCreateLabel("0", $x + 90, $y + 2, 30, 17, $SS_RIGHT)
		GUICtrlSetColor(-1,0x279B61)
			$txtTip = "Your TownHall level."
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Smart Drill Zap Mod
	$x = 30
	$y = 405
	$grpSmartZap = GUICtrlCreateGroup("Stats: Smart Zap", $x - 20, $y - 20, 205, 50)
	    DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($grpSmartZap), "wstr", 0, "wstr", 0)
		GUICtrlSetFont(-1, 10,$FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x808000)
		$y += 5
		$picSmartZap = GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 11, $x + 70, $y-5, 21, 21)
	    $lblSmartZap = GUICtrlCreateLabel("0", $x-15, $y-3, 80, 30, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
		$txtTip = "The amount of Dark Elixir you zapped."
	    GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateIcon ($LibDir & "\CGBBOT.dll", 36, $x + 160, $y-5, 21, 21)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x+95, $y-3,60, 30, $SS_RIGHT)
		GUICtrlSetFont(-1,12, $FW_BOLD,Default,"arial",$CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
		$txtTip = "The amount of Lightning Spells Used in zapping."
	    GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GUICtrlCreateTabItem("")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

