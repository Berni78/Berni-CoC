#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: Control GUI For remote addition of mods
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------

;----------------------------------------------------------------------------------------------------------

; Com Error Handler

;----------------------------------------------------------------------------------------------------------

Opt ("RunErrorsFatal", 0)

Global $oMyError = ObjEvent("AutoIt.Error","MyErrFunc")

Func MyErrFunc()

SetLog( "COM Error!" & @CRLF,$COLOR_RED,"arial",12)
SetLog( @WorkingDir & @CRLF & _
  @TAB & " Error scriptline is: "    & @TAB & $oMyError.scriptline     & @CRLF,$COLOR_RED,"arial",10 )

SetLog (  "Error description is: "   & @TAB & $oMyError.description    & @CRLF & _
  @TAB & " Error windescription: "   & @TAB & $oMyError.windescription & @CRLF & _
  @TAB & " Error number is: "        & @TAB & hex($oMyError.number,8)  & @CRLF & _
  @TAB & " Error lastdllerror is: "  & @TAB & $oMyError.lastdllerror   & @CRLF & _
  @TAB & " Error source is: "        & @TAB & $oMyError.source         & @CRLF & _
  @TAB & " Error helpfile is: "      & @TAB & $oMyError.helpfile       & @CRLF & _
  @TAB & " Error helpcontext is: "   & @TAB & $oMyError.helpcontext    & @CRLF _
		 ,$COLOR_RED,"arial",9)

Beep()


If WinExists($Title) = False  Then
    OpenBS()
Else
	PutBSOnTOP()
EndIf

Endfunc


Func PutBSOnTOP()

If WinExists($Title) Then
   WinSetOnTop ( $Title, "", $WINDOWS_ONTOP  )
EndIf

EndFunc