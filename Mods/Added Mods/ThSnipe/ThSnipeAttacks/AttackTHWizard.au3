#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: ;Created by Bushido-21 Modified by The Master

    Script Function: xxxxxxxxxxx
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func AttackTHWizard()
SetLog($thinfo)


SetLog("Attacking TH with Wizard Snipe", $COLOR_BLUE)
;First Group _____________________________________________________________________________________________________
SetLog("Sending 2-6 Wizards.")

AttackTHGridMod($eWiza,2,1,1000,1,1,1) ; deploy 2 Wizards - for Taking Down All Traps
	If CheckOneStar() Then Return
AttackTHGridMod($eWiza,2,Random(2,4,1),1000,2,3,0) ; deploy 4-6 Wizards

For $count = 0 To 20
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

	;Second Group ____________________________________________________________________________________________________
	Setlog("Cant Get 1 Star ? Sending Some 10 More Wizards.")
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys King
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys Queen
    If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys CC
    If CheckOneStar() Then Return
AttackTHGridMod($eWall,4,2,100,1,4,0) ; deploys up to 8 wallbreakers
    If CheckOneStar() Then Return
AttackTHGridMod($eHeal,1,1,100,4,1,0) ; deploys One healer
    If CheckOneStar() Then Return
AttackTHGridMod($eWiza,4,Random(1,3,1),1000,2,3,0) ; deploy 4 Wizards
	If CheckOneStar() Then Return
AttackTHGridMod($eWiza,4,Random(1,4,1),1000,2,3,0) ; deploy 4 Wizards

For $count = 0 To 20
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

	Setlog("Still Cant Get 1 Star ? Sending Again 16 More Wizards.")
SpellTHGridMod($eHSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eWiza,4,Random(2,3,1),1000,2,3,0) ; deploy 8-12 Wizards
	If CheckOneStar() Then Return
AttackTHGridMod($eWiza,4,Random(3,4,1),1000,2,3,0) ; deploy 12-16 Wizards

For $count = 0 To 20
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

    Setlog("Now I know I Need to Send All My Wizards.")
SpellTHGridMod($eRSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eWiza,4,4,1500,2,3,0) ; release 16 Wizards

	If CheckOneStar() Then Return
AttackTHGridMod($eWiza,3,4,1000,2,3,0) ; release 12 Wizards
	If CheckOneStar() Then Return
AttackTHGridMod($eWiza,5,4,1000,2,3,0) ; release 20 Wizards

For $i = 1 To 5
For $i2 = $eLSpell To $eHaSpell ; Deploy all spells
 If CheckOneStar() Then Return
 SpellTHGridMod($i2)
Next
Next


For $count = 0 To 20
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

    SetLog("~Finished Attacking, waiting to finish", $COLOR_GREEN)
EndFunc ;----AttackTHWizards