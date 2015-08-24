
; #FUNCTION# ====================================================================================================================
 ; Name ..........: checkTownhall
 ; Description ...: This file Includes the Variables and functions to detection the level of a TH
 ; Syntax ........: checkTownhall()
 ; Parameters ....: None
 ; Return values .: $THx, $THy
 ; Author ........: Barracoda
 ; Modified ......: ezeck0001 Then By The Master
 ; Remarks .......: This file is part of ClashGameBot. Copyright 2015
 ;                  ClashGameBot is distributed under the terms of the GNU GPL
 ; Related .......:
 ; Link ..........:
 ; Example .......: No
 ; ===============================================================================================================================


Global $atkTHSuper[5][30]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;TH 6 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 $atkTHSuper[0][0]  = @ScriptDir & "\Mods\images\NewTHimages\6.bmp"
 $atkTHSuper[0][1]  = @ScriptDir & "\Mods\images\NewTHimages\th6_vlt1.png"
 $atkTHSuper[0][2]  = @ScriptDir & "\Mods\images\NewTHimages\th6_lt1.png"
 $atkTHSuper[0][3]  = @ScriptDir & "\Mods\images\NewTHimages\th6btm_vlt1.png"
 $atkTHSuper[0][4]  = @ScriptDir & "\Mods\images\NewTHimages\th6btm_vlt2.png"
 $atkTHSuper[0][5]  = @ScriptDir & "\Mods\images\NewTHimages\th6btm_vlt3.png"
 $atkTHSuper[0][6]  = @ScriptDir & "\Mods\images\NewTHimages\th6top_vlt1.png"
 $atkTHSuper[0][7]  = @ScriptDir & "\Mods\images\NewTHimages\th6top_vlt2.png"
 $atkTHSuper[0][8]  = @ScriptDir & "\Mods\images\NewTHimages\th6top_mt1.png"
 $atkTHSuper[0][9]  = @ScriptDir & "\Mods\images\NewTHimages\th6top_mt2.png"
 $atkTHSuper[0][10] = @ScriptDir & "\Mods\images\NewTHimages\th6top_lt1.png"
 $atkTHSuper[0][11] = @ScriptDir & "\Mods\images\NewTHimages\th6top_lt2.png"
 $atkTHSuper[0][12] = @ScriptDir & "\Mods\images\NewTHimages\th6top_lt3.png"
 $atkTHSuper[0][13] = @ScriptDir & "\Mods\images\NewTHimages\th6top_lt4.png"
 $atkTHSuper[0][14] = @ScriptDir & "\Mods\images\NewTHimages\th6top_mt3.png"
 $atkTHSuper[0][15] = @ScriptDir & "\Mods\images\NewTHimages\th6top_lt5.png"
 $atkTHSuper[0][16] = @ScriptDir & "\Mods\images\NewTHimages\th6btm_lt1.png"
 $atkTHSuper[0][17] = @ScriptDir & "\Mods\images\NewTHimages\th6top_ht1.png"
 $atkTHSuper[0][18] = @ScriptDir & "\Mods\images\NewTHimages\th6top_ht2.png"
 $atkTHSuper[0][19] = @ScriptDir & "\Mods\images\NewTHimages\th6mid_ht1.png"
 $atkTHSuper[0][20] = @ScriptDir & "\Mods\images\NewTHimages\th6.png"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;TH 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 $atkTHSuper[1][0]  = @ScriptDir & "\Mods\images\NewTHimages\7.bmp"
 $atkTHSuper[1][1]  = @ScriptDir & "\Mods\images\NewTHimages\th7b.bmp"
 $atkTHSuper[1][2]  = @ScriptDir & "\Mods\images\NewTHimages\th7c.bmp"
 $atkTHSuper[1][3]  = @ScriptDir & "\Mods\images\NewTHimages\th7d.bmp"
 $atkTHSuper[1][4]  = @ScriptDir & "\Mods\images\NewTHimages\th7e.bmp"
 $atkTHSuper[1][5]  = @ScriptDir & "\Mods\images\NewTHimages\th7f.bmp"
 $atkTHSuper[1][6]  = @ScriptDir & "\Mods\images\NewTHimages\th7g.bmp"
 $atkTHSuper[1][7]  = @ScriptDir & "\Mods\images\NewTHimages\th7h.bmp"
 $atkTHSuper[1][8]  = @ScriptDir & "\Mods\images\NewTHimages\th7i.bmp"
 $atkTHSuper[1][9]  = @ScriptDir & "\Mods\images\NewTHimages\th7new.bmp"
 $atkTHSuper[1][10] = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th7k.bmp"
 $atkTHSuper[1][12] = @ScriptDir & "\Mods\images\NewTHimages\th7l.bmp"
 $atkTHSuper[1][13] = @ScriptDir & "\Mods\images\NewTHimages\th7btm.png"
 $atkTHSuper[1][14] = @ScriptDir & "\Mods\images\NewTHimages\th7top.png"
 $atkTHSuper[1][15] = @ScriptDir & "\Mods\images\NewTHimages\th7top_mt1.png"
 $atkTHSuper[1][16] = @ScriptDir & "\Mods\images\NewTHimages\th7mid_lt1.png"
 $atkTHSuper[1][17] = @ScriptDir & "\Mods\images\NewTHimages\TH7new1.bmp"
 $atkTHSuper[1][18] = @ScriptDir & "\Mods\images\NewTHimages\Th7_1.png" ;Good 75
 $atkTHSuper[1][19] = @ScriptDir & "\Mods\images\NewTHimages\Th7_2.png" ;Good 75
 $atkTHSuper[1][20] = @ScriptDir & "\Mods\images\NewTHimages\Th7_3.png" ;Good 75
 $atkTHSuper[1][21] = @ScriptDir & "\Mods\images\NewTHimages\Th7_4.bmp" ;Good 75
 $atkTHSuper[1][22] = @ScriptDir & "\Mods\images\NewTHimages\Th7_5.bmp" ;Good 75
 $atkTHSuper[1][23] = @ScriptDir & "\Mods\images\NewTHimages\th7.png"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;TH 8 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 $atkTHSuper[2][0]  = @ScriptDir & "\Mods\images\NewTHimages\8.bmp"
 $atkTHSuper[2][1]  = @ScriptDir & "\Mods\images\NewTHimages\th8b.bmp"
 $atkTHSuper[2][2]  = @ScriptDir & "\Mods\images\NewTHimages\th8c.bmp"
 $atkTHSuper[2][3]  = @ScriptDir & "\Mods\images\NewTHimages\th8d.bmp"
 $atkTHSuper[2][4]  = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th8e.bmp"
 $atkTHSuper[2][5]  = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th8f.bmp"
 $atkTHSuper[2][6]  = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th8g.bmp"
 $atkTHSuper[2][7]  = @ScriptDir & "\Mods\images\NewTHimages\th8top.png"
 $atkTHSuper[2][8]  = @ScriptDir & "\Mods\images\NewTHimages\th8btm.png"
 $atkTHSuper[2][9]  = @ScriptDir & "\Mods\images\NewTHimages\th8btm2.png"
 $atkTHSuper[2][10] = @ScriptDir & "\Mods\images\NewTHimages\th8btm3.png"
 $atkTHSuper[2][11] = @ScriptDir & "\Mods\images\NewTHimages\th8top_mt.png"
 $atkTHSuper[2][12] = @ScriptDir & "\Mods\images\NewTHimages\th8mid_ht1.png"
 $atkTHSuper[2][13] = @ScriptDir & "\Mods\images\NewTHimages\th8new.bmp"
 $atkTHSuper[2][14] = @ScriptDir & "\Mods\images\NewTHimages\Th8_1.png" ;Good 75
 $atkTHSuper[2][15] = @ScriptDir & "\Mods\images\NewTHimages\th8_2.png" ;Good 75
 $atkTHSuper[2][16] = @ScriptDir & "\Mods\images\NewTHimages\Th8_3.png" ;Good 75
 $atkTHSuper[2][17] = @ScriptDir & "\Mods\images\NewTHimages\Th8_4.bmp" ;Good 75
 $atkTHSuper[2][18] = @ScriptDir & "\Mods\images\NewTHimages\Th8_5.bmp" ;Good 75
 $atkTHSuper[2][19] = @ScriptDir & "\Mods\images\NewTHimages\Th8_6.bmp" ;Good 70
 $atkTHSuper[2][20] = @ScriptDir & "\Mods\images\NewTHimages\th8.png"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;TH 9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 $atkTHSuper[3][0]  = @ScriptDir & "\Mods\images\NewTHimages\9.bmp"
 $atkTHSuper[3][1]  = @ScriptDir & "\Mods\images\NewTHimages\th9b.bmp"
 $atkTHSuper[3][2]  = @ScriptDir & "\Mods\images\NewTHimages\th9c.bmp"
 $atkTHSuper[3][3]  = @ScriptDir & "\Mods\images\NewTHimages\th9d.bmp"
 $atkTHSuper[3][4]  = @ScriptDir & "\Mods\images\NewTHimages\th9e.bmp"
 $atkTHSuper[3][5]  = @ScriptDir & "\Mods\images\NewTHimages\th9f.bmp"
 $atkTHSuper[3][6]  = @ScriptDir & "\Mods\images\NewTHimages\th9g.bmp"
 $atkTHSuper[3][7]  = @ScriptDir & "\Mods\images\NewTHimages\th9h.bmp"
 $atkTHSuper[3][8]  = "*Trans0xED1C24 "& @ScriptDir & "\Mods\images\NewTHimages\th9i.bmp"
 $atkTHSuper[3][9]  = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th9j.bmp"
 $atkTHSuper[3][10] = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th9k.bmp"
 $atkTHSuper[3][11] = @ScriptDir & "\Mods\images\NewTHimages\th9btm_lt.png"
 $atkTHSuper[3][12] = @ScriptDir & "\Mods\images\NewTHimages\th9btm_lt2.png"
 $atkTHSuper[3][13] = @ScriptDir & "\Mods\images\NewTHimages\th9btm_mt.png"
 $atkTHSuper[3][14] = @ScriptDir & "\Mods\images\NewTHimages\th9top_mt.png"
 $atkTHSuper[3][15] = @ScriptDir & "\Mods\images\NewTHimages\th9top_0t.png"
 $atkTHSuper[3][16] = @ScriptDir & "\Mods\images\NewTHimages\Th9_1.png" ;Good 70
 $atkTHSuper[3][17] = @ScriptDir & "\Mods\images\NewTHimages\Th9_2.png" ;Good 75
 $atkTHSuper[3][18] = @ScriptDir & "\Mods\images\NewTHimages\Th9_3.png" ;Good 75
 $atkTHSuper[3][19] = @ScriptDir & "\Mods\images\NewTHimages\Th9_4.png" ;Good 75
 $atkTHSuper[3][20] = @ScriptDir & "\Mods\images\NewTHimages\Th9_5.png" ;Good 75
 $atkTHSuper[3][21] = @ScriptDir & "\Mods\images\NewTHimages\Th9_6.png" ;Good 75
 $atkTHSuper[3][22] = @ScriptDir & "\Mods\images\NewTHimages\Th9_7.bmp" ;Good 75
 $atkTHSuper[3][23] = @ScriptDir & "\Mods\images\NewTHimages\Th9_8.bmp" ;Good 75
 $atkTHSuper[3][24] = @ScriptDir & "\Mods\images\NewTHimages\Th9_9.bmp" ;Good 75
 $atkTHSuper[3][25] = @ScriptDir & "\Mods\images\NewTHimages\Th9_10.bmp" ;Good 75
 $atkTHSuper[3][26] = @ScriptDir & "\Mods\images\NewTHimages\Th9_11.png" ;Good 70
 $atkTHSuper[3][27] = @ScriptDir & "\Mods\images\NewTHimages\Th9_12.png" ;Good 70
 $atkTHSuper[3][28] = @ScriptDir & "\Mods\images\NewTHimages\Th9_13.png" ;Good 70
 $atkTHSuper[3][29] = @ScriptDir & "\Mods\images\NewTHimages\th9.png"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;TH 10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 $atkTHSuper[4][0]  = @ScriptDir & "\Mods\images\NewTHimages\10.bmp"
 $atkTHSuper[4][1]  = @ScriptDir & "\Mods\images\NewTHimages\th10b.bmp"
 $atkTHSuper[4][2]  = @ScriptDir & "\Mods\images\NewTHimages\th10c.bmp"
 $atkTHSuper[4][3]  = @ScriptDir & "\Mods\images\NewTHimages\th10d.bmp"
 $atkTHSuper[4][4]  = @ScriptDir & "\Mods\images\NewTHimages\th10e.bmpx" ;false positives
 $atkTHSuper[4][5]  = @ScriptDir & "\Mods\images\NewTHimages\th10f.bmp"
 $atkTHSuper[4][6]  = @ScriptDir & "\Mods\images\NewTHimages\th10g.bmp"
 $atkTHSuper[4][7]  = @ScriptDir & "\Mods\images\NewTHimages\th10h.bmp"
 $atkTHSuper[4][8]  = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th10i.bmp"
 $atkTHSuper[4][9]  = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th10j.bmp"
 $atkTHSuper[4][10] = "*Trans0xED1C24 "&@ScriptDir & "\Mods\images\NewTHimages\th10k.bmp"
 $atkTHSuper[4][11] = @ScriptDir & "\Mods\images\NewTHimages\th10btm.png"
 $atkTHSuper[4][12] = @ScriptDir & "\Mods\images\NewTHimages\th10btm_ht.png"
 $atkTHSuper[4][13] = @ScriptDir & "\Mods\images\NewTHimages\th10top_mt.png"
 $atkTHSuper[4][14] = @ScriptDir & "\Mods\images\NewTHimages\th10top_mt2.png"
 $atkTHSuper[4][15] = @ScriptDir & "\Mods\images\NewTHimages\th10top_lt.png"
 $atkTHSuper[4][16] = @ScriptDir & "\Mods\images\NewTHimages\Th10_1.png" ;Good 75
 $atkTHSuper[4][17] = @ScriptDir & "\Mods\images\NewTHimages\Th10_2.png" ;Good 75
 $atkTHSuper[4][18] = @ScriptDir & "\Mods\images\NewTHimages\Th10_3.png" ;Good 75
 $atkTHSuper[4][19] = @ScriptDir & "\Mods\images\NewTHimages\Th10_4.bmp" ;Good 70
 $atkTHSuper[4][20] = @ScriptDir & "\Mods\images\NewTHimages\Th10_5.png" ;Good 75
 $atkTHSuper[4][21] = @ScriptDir & "\Mods\images\NewTHimages\th10.png"

Global $ToleranceTH[5][30]= _
[ _ ;0    1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22   23   24   25   26   27   28   29
 [  75,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,   4,  40,  40,  40,  75,   0,   0,   0,   0,   0,   0,   0,   0,   0 ], _  ;TH 6  [0]
 [  75,  75,  73,  75,  75,  75,  75,  75,  75,  91, 120,   0,  75,  40,  15,  50,  45,  91,  75,  75,  75,  75,  75,  75,   0,   0,   0,   0,   0,   0 ], _  ;TH 7  [1]
 [  75,  70,  70,  70, 120, 120, 120,   4,  15,  10,   4,  10,  50,  35,  75,  75,  75,  75,  75,  70,  75,   0,   0,   0,   0,   0,   0,   0,   0,   0 ], _  ;Th 8  [2]
 [  75,  70,  70,  70,  70,  70,  70,  70, 120, 120, 120,   8,   8,  10,  10,   5,  70,  75,  75,  75,  75,  75,  75,  75,  75,  75,  70,  70,  70,  75 ], _  ;TH 9  [3]
 [  70,  70,  70,  70,  70,  70,  70,  70, 120, 120, 120,  10,  15,  12,  12,  10,  75,  75,  75,  70,  75,  75,   0,   0,   0,   0,   0,   0,   0,   0 ]]    ;TH 10 [4]



Func checkTownhallSuper()
	setlog("Checking Townhall Position With additional Images")
    local $bTHx = -1
    local $bTHy = -1
    _CaptureRegion()

    For $t = 4 to 0 step -1
        For $i = 0 To 29
                If FileExists($atkTHSuper[$t][$i]) Then
                      $THLocation = _ImageSearch($atkTHSuper[$t][$i], 1, $THx, $THy, $ToleranceTH[$t][$i]) ; Getting TH Location
                      If FilterTH()=True Then
                       If $THLocation = 1 and $t >= 1 Then ; add this 'And $OptTrophyMode = 1 ' to use two factor only throphie mode
                          $bTHx = $t
                          $bTHy = $i
                          $ct=$t
                          $ci=$i
                          if $debugTH = 1 then Setlog("found image First "&$t&" ,"&$i&"   "&$THx&", "&$THy)


                          ConfirmTHadv()
                       EndIf
                        If $THLocation = 1 Then
                         $ct=$t
                         $ci=$i
                         $thinfo =" Image Index [" &$ct& "]  [" &$ci& "] - Tol: " &$ToleranceTH[$ct][$ci]& " - Coords: " &$THx& " , " &$THy
						 if $debugTH = 1 then setlog( $thinfo )
                         If FilterTH()=True Then Return $THText[$t]
                         EndIf
                       Endif
                EndIf
          Next
           Next
 ;  Second try
 If $THLocation = 0 And $bTHy <> -1 And $bTHx <> -1 Then
   if $debugTH = 1 then
   Setlog(" \/ Second Try \/ ",$COLOR_GREEN)
   Endif
 _CaptureRegion()
         For $t = 4 to 0 step -1
          For $i = 0 To 29
                If FileExists($atkTHSuper[$t][$i]) Then
                        $THLocation = _ImageSearch($atkTHSuper[$t][$i], 1, $THx, $THy, $ToleranceTH[$t][$i]) ; Getting TH Location
                     If FilterTH()=True Then
                        If $THLocation = 1  And  $bTHx = $t  and $bTHy = $i Then
                       $THLocation = 0
                       Endif
                        If $THLocation =1 then
                          if $debugTH = 1 then Setlog("found image 2nd attemp "&$t&" ,"&$i&"   "&$THx&", "&$THy)
                          $ct=$t
                          $ci=$i
                          ConfirmTHadv()

                        Endif
                       If $THLocation = 1 Then
                         $ct=$t
                         $ci=$i
                         $thinfo =" Image Index [" &$ct& "]  [" &$ci& "] - Tol: " &$ToleranceTH[$ct][$ci]& " - Coords: " &$THx& " , " &$THy
						 if $debugTH = 1 then setlog( $thinfo )
                         If FilterTH()=True Then Return $THText[$t]
                         EndIf
                          EndIf
                EndIf
          Next
           Next
     ; Endif
   Endif
   If $THLocation = 0 Then Return "-"

 EndFunc ;==>checkTownhallSuper

Func ConfirmTHadv()
			For $z = 0 To 29
             If $z <> $ci then
                If FileExists($atkTHSuper[$ct][$z]) Then
                   $CTHx=0
                   $CTHy=0
                      $THLocation = _ImageSearch($atkTHSuper[$ct][$z], 1, $CTHx, $CTHy, $ToleranceTH[$ct][$z]) ; Getting TH Location

                            If $THLocation = 1 Then
							   if $debugTH = 1 then Setlog("found image to compare "&$ct&" ,"&$z&"   "&$CTHx&", "&$CTHy&" $THLocation = "&$THLocation)

                              If $CTHx < ($THx -40) or $CTHx > ($THx + 40) or $CTHy < ($THy -40) or $CTHy > ($THy + 40) Then
                               $THLocation = 0
							   ContinueLoop
							  Endif
                            Endif

							If $THLocation = 1 then
                                if $debugTH = 1 then
                              Setlog("\/  adv  Town Hall Confirmed with 2nd image \/"&$ct&" ,"&$z, $COLOR_GREEN)
                              Endif
                            $z = 30
                            EndIf
                  Endif
                   Endif
                Next
 If $THLocation = 0 then
    if $debugTH = 1 then
 Setlog("\/  adv  Town Hall image not Confirmed \/", $COLOR_RED)
 endif
 Endif
 return
 EndFunc ;<=== ConfirmTHadv()
