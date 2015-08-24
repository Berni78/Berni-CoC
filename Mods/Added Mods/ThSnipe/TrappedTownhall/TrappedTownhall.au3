;l; #FUNCTION# ====================================================================================================================
; Name ..........: TrapedTownhalls
; Description ...: This file Includes the Variables and functions to detect certain defenses near TH, based on checkTownhall.au3
; Syntax ........:
; Parameters ....: None
; Return values .:
; Author ........: The Master
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================


Func TrappedTHCond()

If _GUICtrlComboBox_GetCurSel($cmbDetectTrapedTH) <> 0 Then
If $OptTrophyMode = 1 And SearchTownHallLoc() = True And $searchTH <> "-" Then
$searchDef = checkDefense()
SetLog($searchDef)
$TrappedAllIn = False

If $skipBase = True Then
$skipBase = False

Switch  _GUICtrlComboBox_GetCurSel($cmbDetectTrapedTH)
	Case 0
	  ;do nothing
	Case 1
	     $TrappedAllIn = True
	     Setlog("Trapped TH detected.. Let's do this!", $COLOR_ORANGE)
	Case 2
	     $searchTH = "-"
	     Setlog("Trapped TH detected..Skipping Th", $COLOR_ORANGE)
EndSwitch

EndIf
EndIf
EndIf

EndFunc


Func AttackTrappedTHAllIn()
$TrappedAllIn = False
SetLog($thinfo)
SetLog("Attack Th all In...sending Traps Eaters...", $COLOR_GREEN)
AttackTHGridMod($eBarb,4,1,2000,1,4,0) ; deploys 4 Barbarians to "reveal" teslas or bombs
    If CheckOneStar() Then Return
AttackTHGridMod($eGiant,4,1,1000,1,4,0) ;releases 4 giants spread out to take traps
     If CheckOneStar() Then Return

Setlog("Send In every one!", $COLOR_GREEN)
SpellTHGridMod($eHSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eGiant,4,6,100,2,5,0) ; deploys up to 24 giant
    If CheckOneStar() Then Return
AttackTHGridMod($eWall,4,2,100,1,4,0) ; deploys up to 8 wallbreakers
    If CheckOneStar() Then Return
AttackTHGridMod($eHeal,1,1,100,4,1,0) ; deploys One healer
    If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys CC
    If CheckOneStar() Then Return
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys King
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys Queen
    If CheckOneStar() Then Return
SpellTHGridMod($eRSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,5,10,100,2,5,0) ; deploys up to 50 barbarians
	If CheckOneStar() Then Return
AttackTHGridMod($eArch,5,10,100,1,4,0) ; deploys up to 50 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,5,10,100,3,5,0) ; deploys up to 50 barbarians
	If CheckOneStar() Then Return
AttackTHGridMod($eArch,5,10,100,2,4,0) ; deploys up to 50 archers
	If CheckOneStar() Then Return
SpellTHGridMod($eHSpell)
    If CheckOneStar() Then Return
SpellTHGridMod($eRSpell)

For $i = $eBarb To $eArch ; Deploy Remaining Barb,archers
 If CheckOneStar() Then Return
 AttackTHGridMod($i,5,20,100,0,4,0)
Next

For $i = $eGole To $eLava ; Deploy Remaining troops
 If CheckOneStar() Then Return
 AttackTHGridMod($i,5,2,100,0,4,0)
Next

For $i = $eGiant To $eValk ; Deploy Remaining troops
 If CheckOneStar() Then Return
 AttackTHGridMod($i,5,10,100,0,4,0)
Next

For $i = 1 To 5
For $i2 = $eLSpell To $eHaSpell ; Deploy all spells
 If CheckOneStar() Then Return
 SpellTHGridMod($i2)
Next
Next

SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)

For $count = 0 To 60
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

EndFunc ;---AttackTrappedTH
