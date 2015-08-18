#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: Control GUI For remote addition of mods
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Global $count
Global $CtrlsNumber
Global $CtrlPrevState [2]
GUISetState(@SW_UNLOCK,$frmBot)
$FirstCtrlToDisableMod = GUICtrlCreateDummy()
GUICtrlSetOnEvent($btnStart, "btnStartAdd")
GUICtrlSetOnEvent($btnStop, "btnStopAdd")

Func ShowGUI()
readConfigMod()
applyConfigMod()

GUISwitch($frmBot, $tabGeneral)
GUISetState()
GUICtrlCreateTabItem("")

GUISetState(@SW_SHOWNORMAL,$frmBot)

EndFunc

Func DisableModCtrlsStart()

$CtrlsNumber = $LastCtrlToDisableMod - $FirstCtrlToDisableMod
ReDim $CtrlPrevState [$CtrlsNumber+2]
	For $i = 1 To $CtrlsNumber
		$CtrlPrevState[$i] = GUICtrlGetState($i + $FirstCtrlToDisableMod)
		GUICtrlSetState($i + $FirstCtrlToDisableMod, $GUI_DISABLE)
	Next

EndFunc

Func ReturnCtrlsState()

	For $i = 1 To $CtrlsNumber
		GUICtrlSetState($i + $FirstCtrlToDisableMod, $CtrlPrevState[$i])
	Next

EndFunc

Func btnStartAdd()
;Config
saveConfigMod()
readConfigMod()
applyConfigMod()
;Config end
DisableModCtrlsStart()
btnStart()
EndFunc

Func btnStopAdd()
ReturnCtrlsState()
btnStop()
EndFunc