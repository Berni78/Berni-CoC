#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:    barracoda Modified by The Master

    Script Function: AttackTHGbarchMod
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func AttackTHGbarchMod()

Setlog("Sending 1st wave of archers.")

AttackTHGridMod($eArch, 4, 1, 2000, 1, 4, 0) ; deploys 4 archers - take out possible bombs

AttackTHGridMod($eArch, 3, Random(5, 6, 1), 1000, 1, 4, 0) ; deploys 15-18 archers

For $count = 0 To 30
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

Setlog("Sending second wave of archers.")
AttackTHGridMod($eArch, 4, Random(4, 5, 1), 1000, 2, 4, 0) ;deploys 16-20 archers

For $count = 0 To 30
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

Setlog("Still no star - Let's send in more diverse troops!")

AttackTHGridMod($eGiant, 2, 1, 1240, 1, 2, 0) ;deploys 2 giants in case of spring traps
    If CheckOneStar() Then Return
AttackTHGridMod($eGiant, 2, Random(3, 4, 1), 1500, 2, 2, 0) ;deploys 6-8 giants to take heat
    If CheckOneStar() Then Return
SpellTHGrid($eHSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb, 3, Random(4, 5, 1), 1000, 1, 5, 0) ; deploys up to 12-15 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb, 4, Random(4, 5, 1), 1500, 1, 5, 0) ; deploys up to 16-20 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch, 3, 8, 1200, 3, 4, 0) ; deploys 24 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eArch, 4, 7, 1000, 3, 4, 0) ; deploys 28 archers

For $count = 0 To 30
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

Setlog("Hope the rest of your troops can finish the job!")
SpellTHGrid($eHSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eGiant, 2, 9, 1500, 3, 2, 1) ;deploys 18 giants
    If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys CC
    If CheckOneStar() Then Return
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys King
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys Queen
    If CheckOneStar() Then Return
SpellTHGrid($eRSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb, 4, 8, 1200, 2, 5, 0) ; deploys up to 32 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch, 3, 13, 1210, 4, 4, 0) ;deploys up to 39 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb, 3, 11, 1190, 2, 5, 0) ; deploys up to 33 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch, 2, 20, 1200, 4, 4, 0) ;deploys up to 40 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb, 4, 9, 1500, 2, 5, 0) ; deploys up to 36 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch, 2, 20, 1000, 4, 4, 0) ;deploys up to 40 archers

For $count = 0 To 35
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

SetLog("All Giants, Barbs, and Archers should be deployed, in addition to Heroes & CC (if options are selected). Other troops are not meant to be deployed in this algorithm.", $COLOR_GREEN)

EndFunc   ;==>AttackTHGbarchMod