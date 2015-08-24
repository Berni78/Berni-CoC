#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: ;;;;; Created by swvr ;;;;;;;;  Modified by The Master

    Script Function:AttackTHDragon
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func AttackTHDragon()

SetLog($thinfo)
Setlog("Sniping TH with Dragon Snipe",0x9e3f1b)

;First Group _____________________________________________________________________________________________________________________
Setlog("Sending some troops.")
AttackTHGridMod($eDrag,1,1,500,1,1,0) ;releases 1 dragons


For $count = 0 To 30
_Sleep(1000)
If CheckOneStar() Then Return
Next

; Second Group ____________________________________________________________________________________________________________________
Setlog("No star yet? More troops needed.")
AttackTHGridMod($eDrag,1,1,500,1,1,0) ;releases 1 dragons

For $count = 0 To 25
_Sleep(1000)
If CheckOneStar() Then Return
Next

;Third Group ______________________________________________________________________________________________________________________
Setlog("No star yet? Even more trops.")
AttackTHGridMod($eDrag,3,1,500,1,1,0) ;releases 2 dragons

For $count = 0 To 25
_Sleep(1000)
If CheckOneStar() Then Return
Next

;Fourth Group _____________________________________________________________________________________________________________________
Setlog("I smell a trap! Let's send more troops...")
SpellTHGridMod($eHSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eDrag,1,1,500,1,1,0) ;releases 1 dragons
	If CheckOneStar() Then Return
AttackTHGridMod($eDrag,1,1,500,1,1,0) ;releases 1 dragons
    If CheckOneStar() Then Return
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys king
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys queen
    If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys cc
    If CheckOneStar() Then Return
SpellTHGridMod($eRSpell)

For $count = 0 To 25
_Sleep(1000)
If CheckOneStar() Then Return
Next

;Fifth Group _______________________________________________________________________________________________________________________
Setlog("Definetly a trap!")
SpellTHGridMod($eRSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eDrag,3,1,500,1,1,0) ;releases 2 dragons

For $count = 0 To 10
_Sleep(1000)
If CheckOneStar() Then Return
Next

;Final Group ________________________________________________________________________________________________________________________
Setlog("Ok, this is getting serious, saved the best for last!")
AttackTHGridMod($eDrag,3,1,500,1,1,0) ;releases 3 dragons

For $i = 1 To 5
For $i2 = $eLSpell To $eHaSpell ; Deploy all spells
 If CheckOneStar() Then Return
 SpellTHGridMod($i2)
Next
Next

For $count = 0 To 25
_Sleep(1000)
If CheckOneStar() Then Return
Next

SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)
EndFunc ;===>AttackTHDragons