Func Switchmain()
 Send("{CapsLock off}")
;If BitAND(GUICtrlGetState($btnStop), $GUI_ENABLE) Then
;ControlClick('[REGEXPTITLE:(?i).*?Clash Game Bot*?]', "Stop Bot", "[CLASS:Button; TEXT:Stop Bot]", "left", "1")
$building  =(@ScriptDir & "\mainb.ini")
If FileExists($building) Then
	SaveConfig()
	readConfig()
	applyConfig()
EndIf
$config =(@ScriptDir & "\main.ini")
GUICtrlSetData ($account, "main")
	  SaveConfig()
	  readConfig()
	  applyConfig()
	  SetLog("Config loaded successfully!", $COLOR_GREEN)

;Opt("SendCapslockMode", 0)

	Click(821, 523) ;Click Switch
    Sleep (2000)
	Click(437, 399) ;Click  Disconn
	Sleep (2000)
	Click(437, 399) ;Click  Disconn
	Sleep (6000)
	Click(306, 313) ;Select main  account
	Sleep (2000)
	Click(570, 457) ;Click ok

	Sleep (8000)
	Click(509, 402) ;Click load
	Sleep (2000)
    Click(339, 195) ;Click txt
    Sleep (2000)

ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{LSHIFT UP}")  ;Enter  Confirm  txt
ControlSend($Title, "", "", "{LSHIFT DOWN}{O DOWN}{O UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{N DOWN}{N UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{F DOWN}{F UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{I DOWN}{I UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{R DOWN}{R UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{M DOWN}{M UP}{LSHIFT UP}")
	Sleep (2000)
	Click(521, 198) ;Click Confirm


	;ControlClick('[REGEXPTITLE:(?i).*?Clash Game Bot*?]', "Start Bot", "[CLASS:Button; TEXT:Start Bot]", "left", "1")
	;EndIf
EndFunc

Func Switchmini()
  Send("{CapsLock off}")
;If BitAND(GUICtrlGetState($btnStop),  $GUI_HIDE)   Then
;ControlClick('[REGEXPTITLE:(?i).*?Clash Game Bot*?]', "Stop Bot", "[CLASS:Button; TEXT:Stop Bot]", "left", "1")
$building  =(@ScriptDir & "\minib.ini")
If FileExists($building) Then
	readConfig()
	applyConfig()
EndIf
$config =(@ScriptDir & "\mini.ini")
;GUICtrlSetData ($account, "mini")
	  readConfig()
	  applyConfig()
	  SetLog("Config loaded successfully!", $COLOR_GREEN)

;Opt("SendCapslockMode", 0)
;Send("{CapsLock off}")
	Click(821, 523) ;Click Switch
    Sleep (2000)
	Click(437, 399) ;Click  Disconn
	Sleep (2000)
	Click(437, 399) ;Click  Disconn
	Sleep (6000)
	Click(301, 359) ;select mini  account
	Sleep (2000)
	Click(570, 457) ;Click ok

	Sleep (8000)
	Click(509, 402) ;Click load
	Sleep (2000)
    Click(339, 195) ;Click txt
    Sleep (2000)

ControlSend($Title, "", "", "{LSHIFT DOWN}{C DOWN}{C UP}{LSHIFT UP}")  ;Enter  Confirm  txt
ControlSend($Title, "", "", "{LSHIFT DOWN}{O DOWN}{O UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{N DOWN}{N UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{F DOWN}{F UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{I DOWN}{I UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{R DOWN}{R UP}{LSHIFT UP}")
ControlSend($Title, "", "", "{LSHIFT DOWN}{M DOWN}{M UP}{LSHIFT UP}")
	Sleep (2000)
	Click(521, 198) ;Click Confirm
	Sleep (2000)

	;ControlClick('[REGEXPTITLE:(?i).*?Clash Game Bot*?]', "Start Bot", "[CLASS:Button; TEXT:Start Bot]", "left", "1")
	;EndIf
EndFunc
