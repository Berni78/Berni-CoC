Func Switchmain()
    Send("{CapsLock off}")
	Click(821, 523) ;Click Switch
    Sleep (1000)

selectmain()

 loadmain()

;....................................
Sleep (1000)
    Click(339, 195) ;Click Confirm txtbox
	Sleep (1000)
ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}")  ;Enter  Confirm  txt
Sleep (1000)
	Click(521, 198) ;Click Confirm
	$RunState = True
While 1
		waitMainScreen()
		ExitLoop
	WEnd
DetectAccount()
$fullArmy = False

EndFunc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func Switchmini()

    Send("{CapsLock off}")
	Click(821, 523) ;Click Switch
    Sleep (1000)

selectmini()

 loadmini()

;....................................


	$RunState = True
While 1
		waitMainScreen()
		ExitLoop
	WEnd
DetectAccount()
$fullArmy = False


EndFunc



Func selectmini()

	Click(437, 399) ;Click  Disconn
	Sleep (1000)
	Click(437, 399) ;Click  Disconn
While 1

$Variable =  _PixelSearch(164, 45, 166, 281, Hex(0x70A443, 6), 0)
If IsArray ($Variable) = True Then
SetLog("Mini account selected", $COLOR_blue)
   Click($Variable[0], $Variable[1]+113) ;Select 2nd account
   ExitLoop

EndIf

WEnd

Sleep (1000)
	Click(570, 457) ;Click ok
 EndFunc
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func loadmini2()
   Local $iLoopCount = 0
   While 1
 $Variable =  _PixelSearch(487, 387, 492, 391, Hex(0xC2E065, 6), 0);load pixel
If IsArray ($Variable) = True Then
   Click($Variable[0], $Variable[1])

Sleep (1000)
    Click(339, 195) ;Click Confirm txtbox
	Sleep (1000)
ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}")  ;Enter  Confirm  txt
Sleep (1000)
	Click(521, 198) ;Click Confirm
   ExitLoop

EndIf
$iLoopCount += 1
ConsoleWrite ($iLoopCount & @CRLF)
If $iLoopCount > 1500 Then
selectmini()
loadmini()
ExitLoop
EndIf
WEnd

EndFunc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func loadmini()
Local $iLoopCount = 0
While 1

$Variable =  _PixelSearch(487, 387, 492, 391, Hex(0xC2E065, 6), 0);load pixel
If IsArray ($Variable) = True Then
   Click($Variable[0], $Variable[1])
   Sleep (1000)
    Click(339, 195) ;Click Confirm txtbox
	Sleep (1000)
ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}")  ;Enter  Confirm  txt
Sleep (1000)
	Click(521, 198) ;Click Confirm
   ExitLoop

EndIf
$iLoopCount += 1
ConsoleWrite ($iLoopCount & @CRLF)
If $iLoopCount > 1500 Then

 selectmini()
loadmini2()
ExitLoop
EndIf

 WEnd
EndFunc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func loadmain()
Local $iLoopCount = 0
While 1

$Variable =  _PixelSearch(487, 387, 492, 391, Hex(0xC2E065, 6), 0);load pixel
If IsArray ($Variable) = True Then
   Click($Variable[0], $Variable[1])
   Sleep (1000)
    Click(339, 195) ;Click Confirm txtbox
	Sleep (1000)
ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}")  ;Enter  Confirm  txt
Sleep (1000)
	Click(521, 198) ;Click Confirm
   ExitLoop

EndIf
$iLoopCount += 1
ConsoleWrite ($iLoopCount & @CRLF)
If $iLoopCount > 1500 Then
  selectmain()
loadmain2()
ExitLoop
EndIf
 WEnd
EndFunc

Func loadmain2()
   Local $iLoopCount = 0
   While 1
 $Variable =  _PixelSearch(487, 387, 492, 391, Hex(0xC2E065, 6), 0);load pixel
If IsArray ($Variable) = True Then
   Click($Variable[0], $Variable[1])

Sleep (1000)
    Click(339, 195) ;Click Confirm txtbox
	Sleep (1000)
ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{O DOWN}{O UP}{N DOWN}{N UP}{F DOWN}{F UP}{I DOWN}{I UP}{R DOWN}{R UP}{M DOWN}{M UP}{LSHIFT UP}")  ;Enter  Confirm  txt
Sleep (1000)
	Click(521, 198) ;Click Confirm
   ExitLoop

EndIf
$iLoopCount += 1
ConsoleWrite ($iLoopCount & @CRLF)
If $iLoopCount > 1500 Then
selectmain()
loadmain()
ExitLoop
EndIf
WEnd

EndFunc

Func selectmain()
 Click(437, 399) ;Click  Disconn
	Sleep (1000)
	Click(437, 399) ;Click  Disconn


While 1
$Variable =  _PixelSearch(164, 45, 166, 281, Hex(0x70A443, 6), 0)
If IsArray ($Variable) = True Then
SetLog("Main account selected", $COLOR_blue)
   Click($Variable[0], $Variable[1]+63) ;Select 1st account
   ExitLoop

EndIf
If isProblemAffect(True) Then $Restart (True)
WEnd

Sleep (1000)
	Click(570, 457) ;Click ok
EndFunc
;Func checkerror()
;If isProblemAffect(True) Then
 ; SetLog("home.", $COLOR_RED)
;While 1
;		waitMainScreen()
;		ExitLoop
;	WEnd
;$RunState = False
;DetectAccount()
;$Restart (True)
;$fullArmy = False
;EndIf
;EndFunc
