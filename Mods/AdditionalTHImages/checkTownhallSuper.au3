; #FUNCTION# ====================================================================================================================
; Name ..........: checkTownhall
; Description ...: This file Includes the Variables and functions to detection the level of a TH
; Syntax ........: checkTownhall()
; Parameters ....: None
; Return values .: $THx, $THy
; Author ........: Barracoda
; Modified ......: By The Master
; Remarks .......: This file is part of ClashGameBot. Copyright 1015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Global $atkTHSuper[5][27], $thinfo


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$atkTHSuper[0][1]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6btm_lt1.png"
$atkTHSuper[0][2]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6btm_vlt1.png"
$atkTHSuper[0][3]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6btm_vlt2.png"
$atkTHSuper[0][4]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6btm_vlt3.png"
$atkTHSuper[0][5]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6mid_ht1.png"
$atkTHSuper[0][6]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_ht1.png"
$atkTHSuper[0][7]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_ht2.png"
$atkTHSuper[0][8]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_lt1.png"
$atkTHSuper[0][9]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_lt2.png"
$atkTHSuper[0][10]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_lt3.png"
$atkTHSuper[0][11] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_lt4.png"
$atkTHSuper[0][12] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_lt5.png"
$atkTHSuper[0][13] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_mt1.png"
$atkTHSuper[0][14] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_mt2.png"
$atkTHSuper[0][15] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_mt3.png"
$atkTHSuper[0][16] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_vlt1.png"
$atkTHSuper[0][17] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6top_vlt2.png"
$atkTHSuper[0][18] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht1.png"
$atkTHSuper[0][19] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht2.png"
$atkTHSuper[0][10] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht3.png"
$atkTHSuper[0][21] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht4.png"
$atkTHSuper[0][22] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht5.png"
$atkTHSuper[0][23] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht6.png"
$atkTHSuper[0][24] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_ht7.png"
$atkTHSuper[0][25] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_lt1.png"
$atkTHSuper[0][26] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th6_vlt1.png"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$atkTHSuper[1][1]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7btm.png"
$atkTHSuper[1][2]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7mid_lt1.png"
$atkTHSuper[1][3]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7top.png"
$atkTHSuper[1][4]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7top_mt1.png"
$atkTHSuper[1][5]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th7_1.png"
$atkTHSuper[1][6]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th7_2.png"
$atkTHSuper[1][7]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th7_3.png"
$atkTHSuper[1][8]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th7_4.png"
$atkTHSuper[1][9]  = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht1.png"
$atkTHSuper[1][10] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht2.png"
$atkTHSuper[1][11] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht3.png"
$atkTHSuper[1][12] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht4.png"
$atkTHSuper[1][13] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht5.png"
$atkTHSuper[1][14] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht6.png"
$atkTHSuper[1][15] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht7.png"
$atkTHSuper[1][16] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th7_ht8.png"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$atkTHSuper[2][2] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8btm2.png"
$atkTHSuper[2][3] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8btm3.png"
$atkTHSuper[2][4] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8mid_ht1.png"
$atkTHSuper[2][5] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8top.png"
$atkTHSuper[2][6] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8top_mt.png"
$atkTHSuper[2][7] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th8_1.png"
$atkTHSuper[2][8] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8_2.png"
$atkTHSuper[2][9] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th8_3.png"
$atkTHSuper[2][10] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th8_4.png"
$atkTHSuper[2][11] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th8_ht1.png"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$atkTHSuper[3][1] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th9btm.png"
$atkTHSuper[3][2] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th9btm_lt.png"
$atkTHSuper[3][3] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th9btm_lt2.png"
$atkTHSuper[3][4] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th9btm_mt.png"
$atkTHSuper[3][5] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th9top_0t.png"
$atkTHSuper[3][6] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th9top_mt.png"
$atkTHSuper[3][7] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_1.png"
$atkTHSuper[3][8] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_2.png"
$atkTHSuper[3][9] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_3.png"
$atkTHSuper[3][10] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_4.png"
$atkTHSuper[3][11] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_5.png"
$atkTHSuper[3][12] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_6.png"
$atkTHSuper[3][13] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_7.png"
$atkTHSuper[3][14] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th9_8.png"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$atkTHSuper[4][1] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th10btm.png"
$atkTHSuper[4][2] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th10btm_ht.png"
$atkTHSuper[4][3] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th10top_lt.png"
$atkTHSuper[4][4] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th10top_mt.png"
$atkTHSuper[4][5] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\th10top_mt2.png"
$atkTHSuper[4][6] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th10_1.png"
$atkTHSuper[4][7] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th10_2.png"
$atkTHSuper[4][8] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th10_3.png"
$atkTHSuper[4][9] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th10_4.png"
$atkTHSuper[4][10] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th10_5.png"
$atkTHSuper[4][11] = @ScriptDir & "\Mods\AdditionalTHImages\NewTHimages\Th10_6.png"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Global $ToleranceTHSuper[5][27]
Global $ToleranceTHSuper[5][27] =[ [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,10,10,10,10,10,10,10,4,4] _
                                  ,[10,4,4,4,4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10] _
								  ,[10,4,4,4,4,4,4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10] _
								  ,[10,4,4,4,4,4,4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10] _
								  ,[10,4,4,4,4,4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10] ]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func checkTownhallSuper()
	setlog("Checking Townhall Position With additional Images")
	_CaptureRegion()
	For $t=0 to 4
		 For $i = 1 To 26
			   If FileExists($atkTHSuper[$t][$i]) Then
					 $THLocation = _ImageSearch($atkTHSuper[$t][$i], 1, $THx, $THy, $ToleranceTHSuper[$t][$i]) ; Getting TH Location
					 If $THLocation = 1 Then
						   $thinfo = "Tol:"&$ToleranceTHSuper[$t][$i]&" - Coords:"&$THx&","&$THy & " Image Number: " & $t & $i
						   If FilterTH()= True Then Return $THText[$t]
					 EndIf
			   EndIf
		 Next
	Next
   If $THLocation = 0 Then Return "-"

EndFunc
