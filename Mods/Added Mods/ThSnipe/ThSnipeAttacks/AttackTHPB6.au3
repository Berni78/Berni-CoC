#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: mojacka ( Modified By The Master)

    Script Function: AttackTHPB6
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func AttackTHPB6()
SetLog($thinfo)
	; $eBarb, $eArch, $eGiant, $eGobl, $eWall, $eBall, $eWiza, $eHeal, $eDrag, $ePekk, $eMini, $eHogs, $eValk, $eGole, $eWitc, $eLava
	; $eKing, $eQueen, $eCastle, $eLSpell, $eHSpell, $eRSpell, $eJSpell, $eFSpell, $ePSpell, $eESpell, $eHaSpell
	;  AttackTHGridMod($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)

Setlog("Free meal")
AttackTHGridMod($eArch, 4, 1, 1500, 1, 4, 0) ; deploys 4 archers - take out possible bombs
AttackTHGridMod($eArch, 4, Random(2, 3, 1), 500, 2, 4, 0) ; deploys 8 - 12 archers

	For $count = 0 To 25
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
    Next

Setlog("Fool me once shame on you, fool me twice shame on me")
AttackTHGridMod($eBarb, 4, Random(3, 5, 1), 500, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eWall, 1, Random(2, 4, 1), 500, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eGobl, 1, Random(2, 4, 1), 500, 1, 1, 0) ; time to drop goblins if there are some mainly for distraction and some loot
	If CheckOneStar() Then Return
AttackTHGridMod($eArch, 4, Random(3, 5, 1), 500, 3, 4, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eMini, 4, 5, 500, 1, 1, 0)

	For $count = 0 To 15
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
    Next

Setlog("Now I am really angry!") ;Send in the Defense specialists - Giants, Ballons and Hogriders
AttackTHGridMod($eGiant, 2, 1, 1000, 1, 2, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eGiant, 4, Random(1, 2, 1), 1000, 2, 2, 0)
	If CheckOneStar() Then Return
SpellTHGridMod($eHSpell)
	If CheckOneStar() Then Return
AttackTHGridMod($eWall,4,2,100,1,4,0) ; deploys up to 8 wallbreakers
    If CheckOneStar() Then Return
AttackTHGridMod($eHeal,1,1,100,4,1,0) ; deploys One healer
    If CheckOneStar() Then Return
AttackTHGridMod($eBall, 2, Random(2, 4, 1), 500, 1, 1, 0) ;
	If CheckOneStar() Then Return
AttackTHGridMod($eHogs, 2, Random(2, 4, 1), 500, 1, 1, 0) ;
	If CheckOneStar() Then Return
AttackTHGridMod($eArch, 4, 5, 500, 4, 4, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eWiza, 4, Random(1, 2, 1), 500, 1, 1, 0)

	For $count = 0 To 10
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
    Next

Setlog("ALL IN!!!") ;Desperate times need desperate measures

	; Drop all possible remaining troops
SpellTHGridMod($eRSpell)
	If CheckOneStar() Then Return
AttackTHGridMod($eBarb, 4, 20, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eArch, 4, 20, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eGiant, 4, 5, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eGobl, 4, 20, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eWall, 4, 5, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eBall, 4, 5, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eWiza, 4, 5, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eMini, 4, 10, 100, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eHogs, 4, 5, 100, 1, 1, 0)
	If CheckOneStar() Then Return
SpellTHGridMod($eRSpell)
	If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys CC
    If CheckOneStar() Then Return
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys King
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys Queen
    If CheckOneStar() Then Return
AttackTHGridMod($eGole, 3, 1, 1000, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eWitc, 4, 1, 500, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eLava, 3, 1, 1000, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eDrag, 4, 5, 500, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($ePekk, 3, 1, 500, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eValk, 4, 5, 500, 1, 1, 0)
	If CheckOneStar() Then Return
AttackTHGridMod($eCastle, 1, 1, 500, 1, 1, 0)
	If CheckOneStar() Then Return

For $i = 1 To 5
For $i2 = $eLSpell To $eHaSpell ; Deploy all spells
 If CheckOneStar() Then Return
 SpellTHGridMod($i2)
Next
Next

	For $count = 0 To 35
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
    Next

EndFunc   ;==>AttackTHPB6