; #FUNCTION# ====================================================================================================================
; Name ..........: SnipeWhileTrain
; Description ...: During the idle loop, if $chkSnipeWhileTrain is checked, the bot will go to pure TH snipe
;                  and return after limit searches to profit from idle time.
; Syntax ........:
; Parameters ....: None
; Return values .: False if not enough troops (30%) True if Limit searches was successfully done.
; Author ........: ChiefM3
; Modified ......: By The Master
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================


Func SnipeWhileTrain()

If GUICtrlRead($chkSnipeWhileTrain) = $GUI_CHECKED And $CommandStop <> 0 And $CommandStop <> 3 Then

  ; Attempt only when 35% army full to prevent failure of TH snipe
  If ($CurCamp <= ($TotalCamp * 35/100)) Then
  SetLog ("army Capacity below 35% Not enough for Snipe While Train")
  Return False
  EndIf

 If $fullArmy = False And Not($CurCamp >= ($TotalCamp * $fulltroop * 90/100)) Then

  ; Swap variables to pure TH snipe mode
  $tempSnipeWhileTrain[0] = $iChkMeetTrophy[$DB]
  $tempSnipeWhileTrain[1] = $iChkMeetTrophy[$LB]
  $tempSnipeWhileTrain[2] = $iMinTrophy[$DB]
  $tempSnipeWhileTrain[3] = $iMinTrophy[$LB]
  $tempSnipeWhileTrain[4] = $iChkMeetOne[$LB]
  $tempSnipeWhileTrain[5] = $iChkMeetOne[$DB]
  $tempSnipeWhileTrain[6] = $OptTrophyMode
  $tempSnipeWhileTrain[7] = $THaddtiles
  $tempSnipeWhileTrain[8] = $iMinGold[$DB]
  $tempSnipeWhileTrain[9] = $iMinGold[$LB]
  $tempSnipeWhileTrain[10] = $iCmbMeetGE[$DB]
  $tempSnipeWhileTrain[11] = $iCmbMeetGE[$LB]

  ;change values to snipe while train
  $iChkMeetTrophy[$DB]=1
  $iChkMeetTrophy[$LB]=1
  $iMinTrophy[$DB]=99
  $iMinTrophy[$LB]=99
  $iChkMeetOne[$LB]=0
  $iChkMeetOne[$DB]=0
  $OptTrophyMode=1
  $THaddtiles=0
  $iMinGold[$DB] = "999999"
  $iMinGold[$LB] = "999999"
  $iCmbMeetGE[$DB] = "0"
  $iCmbMeetGE[$LB] = "0"

  ;used to Change back values
  $SnipeChangedSettings = True

  ; go to search for Search Limit times
  SetLog("***[Trying TH snipe while training army]***",0x808000)
  $isSnipeWhileTrain = True
  $Is_ClientSyncError = False
  AttackMain()
  $Restart = False ; Sets $Restart as True to end search after Limit Search is over so this return it to false so that the bot dont restart
  $Is_ClientSyncError = False
  $isSnipeWhileTrain = False
  SetLog("***[End trying TH snipe while training army]***",0x808000)

  SWHTrainRevertNormal()

  Return True
EndIf
EndIf
EndFunc

Func SWHTrainRevertNormal()
If $SnipeChangedSettings = True Then
; Change settings back to Original
$iChkMeetTrophy[$DB] = $tempSnipeWhileTrain[0]
$iChkMeetTrophy[$LB] = $tempSnipeWhileTrain[1]
$iMinTrophy[$DB]     = $tempSnipeWhileTrain[2]
$iMinTrophy[$LB]     = $tempSnipeWhileTrain[3]
$iChkMeetOne[$LB]    = $tempSnipeWhileTrain[4]
$iChkMeetOne[$DB]    = $tempSnipeWhileTrain[5]
$OptTrophyMode       = $tempSnipeWhileTrain[6]
$THaddtiles          = $tempSnipeWhileTrain[7]
$iMinGold[$DB]       = $tempSnipeWhileTrain[8]
$iMinGold[$LB]       = $tempSnipeWhileTrain[9]
$iCmbMeetGE[$DB]     = $tempSnipeWhileTrain[10]
$iCmbMeetGE[$LB]     = $tempSnipeWhileTrain[11]
$Is_ClientSyncError = False
EndIf
$SnipeChangedSettings = False
$isSnipeWhileTrain = False
EndFunc

Func SearchLimit($iSkipped)
If $isSnipeWhileTrain And $iSkipped >= Number($itxtSearchlimit) Then

	Local $Wcount = 0
	Local $RH = _PixelSearch(19, 565, 104, 580, Hex(0xD9DDCF, 6), 10)
	While IsArray($RH) = False
	If _Sleep(200) Then Return
    $RH = _PixelSearch(19, 565, 104, 580, Hex(0xD9DDCF, 6), 10)
	$Wcount += 1
	If $Wcount >= 50 Then ExitLoop
	WEnd

    ClickP($aSurrenderButton, 1, 0, "#0030")

	$Restart = True ; To Prevent Initiation of Attack
    Return True

Else
    Return False

EndIf
EndFunc

