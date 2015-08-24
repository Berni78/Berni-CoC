#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:  The Master

    Script Function: SpellTHGridMod
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------


Func SpellTHGridMod($S)
If $ichkUseSpellsTH = 1 Then

	If $THi <= 15 Or $THside = 0 Or $THside = 2 Then
		Switch $THside
			Case 0
				CastSpell($S, 114 + $THi * 19 + Ceiling(-2 * 19), 359 - $THi * 14 + Ceiling(-2 * 14))
			Case 1
				CastSpell($S, 117 + $THi * 19 + Ceiling(-2 * 19), 268 + $THi * 14 - Floor(-2 * 14))
			Case 2
				CastSpell($S, 743 - $THi * 19 - Floor(-2 * 19), 358 - $THi * 14 + Ceiling(-2 * 14))
			Case 3
				CastSpell($S, 742 - $THi * 19 - Floor(-2 * 19), 268 + $THi * 14 - Floor(-2 * 14))
		EndSwitch
	EndIf

    If $THi > 15 And ($THside = 1 Or $THside = 3) Then AttackTHGridMod ( $S ,1,1,100,4,1,0 )

EndIf
EndFunc   ;==>SpellTHGrid