; #FUNCTION# ====================================================================================================================
; Name ..........: ClearObstacles.au3
; Description ...: This file Includes function to Remove Trees/Tomps/gembox.
; Syntax ........:
; Parameters ....: None
; Return values .: False if regular farming is needed to refill storage
; Author ........: z0mbie
; Modified ......: The Master
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

Global $ObsFolder = 0

GUICtrlSetData ($chkTombstones,"Clear Tomb/Field")
;$chkTombstones = GUICtrlCreateCheckbox("Clear Tomb/Field", $x + 75, $y + 2, -1, -1)
 $txtTip = "Check this to automatically clear tombstones and obstacles (tree,bush,etc.) on the field."
GUICtrlSetTip ($chkTombstones,$txtTip)

Func ClearObstacles()

	Local $ObstacleX, $ObstacleY
	Local $obstacles[10]
	Local $ObstacleLoopCounter = 0

	If $ichkTombstones <> 1 Then Return False

	If $ObsFolder < 0 Or $ObsFolder > 2 Then
		$ObsFolder = 0
	EndIf

	SetLog("Clear an Obstacle on the Field", $COLOR_BLUE)

	Local $aGetBuilders = StringSplit(getBuilders($aBuildersDigits[0], $aBuildersDigits[1]), "#", $STR_NOCOUNT)
	$FreeBuilder = $aGetBuilders[0]
	$TotalBuilders = $aGetBuilders[1]
	If $debugSetlog = 1 Then Setlog("No. of Free/Total Builders: " & $FreeBuilder & "/" & $TotalBuilders, $COLOR_GREEN)

	If $FreeBuilder < 1 Then
		SetLog("No Builders", $COLOR_RED)
		Return
	EndIf

	$obstacles[0] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\gem.bmp"
	$obstacles[1] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\bush.bmp"
	$obstacles[2] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\tree.bmp"
	$obstacles[3] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\mtree.bmp"
	$obstacles[4] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\btree.bmp"
	$obstacles[5] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\vtrunk.bmp"
	$obstacles[6] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\htrunk.bmp"
	$obstacles[7] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\mushroom.bmp"
	$obstacles[8] = @ScriptDir & "\Mods\Remove Trees\obstacles\" & string($ObsFolder) & "\Gembox.bmp"

	For $obsCnt = 0 To 8

		If Not FileExists($obstacles[$obsCnt]) Then
			SetLog("File Not Found", $COLOR_RED)
			Return False
		EndIf
		$res = ""

		_CaptureRegion()
		$sendHBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBitmap)
		$res = DllCall(@ScriptDir & "\Mods\Remove Trees\lib\ImageSearch.dll", "str", "searchTile", "handle", $sendHBitmap, "str", $obstacles[$obsCnt], "float", 0.910)
		_WinAPI_DeleteObject($sendHBitmap)


		If IsArray($res) Then
		;SetLog("DLL Call succeeded " & $res[0], $COLOR_RED)
			If $res[0] = "0" Then
				; failed to find any obstacles to clear on the field
				; SetLog("Obstacle Type " & $obsCnt & " not found", $COLOR_RED)
				$res = ""
			ElseIf $res[0] = "-1" Then
				SetLog("DLL Error", $COLOR_RED)
				return
			Else
				$expRet = StringSplit($res[0], "|", 2)
				For $j = 1 To UBound($expRet) - 1 Step 2
					$ObstacleX = Int($expRet[$j])
					$ObstacleY = Int($expRet[$j + 1])

					If isInsideBigDiamondXY($ObstacleX, $ObstacleY) Then
						If _Sleep(500) Then Return
						Click($ObstacleX, $ObstacleY,1,0,"#0120")
						If _Sleep(1000) Then Return
						_CaptureRegion()
						If _ColorCheck(_GetPixelColor(432, 592), Hex(0xE82CD0, 6), 20) Then ; Check Elix
							SetLog("Obstacle found... Removing", $COLOR_GREEN)
							If _Sleep(500) Then Return
							Click(431, 595,1,0,"#0120")
							If _Sleep(1000) Then Return
							ClickP($aTopLeftClient,1,0,"#0121") ; click away
							If _Sleep(500) Then Return
							Return True
						EndIf
						ClickP($aTopLeftClient,1,0,"#0121") ; click away
						If _Sleep(500) Then Return
						EndIf
						$ObstacleLoopCounter += 1
						If($ObstacleLoopCounter > 3) Then ExitLoop
				Next
			EndIf
		Else
			SetLog("DLL Error", $COLOR_RED)
			return
		EndIf
	Next

	$ObsFolder += 1
	SetLog("No Obstacle Found", $COLOR_RED)

	Return
EndFunc   ;==>clearField
