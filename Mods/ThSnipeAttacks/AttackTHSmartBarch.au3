#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author: ;;;;; Created by swvr ;;;;;;;;  Modified by The Master

    Script Function: AttackTHSmartBarch
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func AttackTHSmartBarch()
SetLog($thinfo)
;;;;; Created by swvr ;;;;;;;;  Modified by The Master

Setlog("Sniping TH with SmartBarch",$COLOR_BLUE)

;AttackTHGridMod($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)

; 1st wave 30 secs, total 4 barbs 8 archers, works for totally unprotected TH ___________________________________________________________________________________________
SetLog("Attacking TH with 1st wave of BARCH", $COLOR_BLUE)

AttackTHGridMod($eBarb,4,1,2000,1,4,0) ; deploys 4 barbarians to take out traps waits 2 seconds for bombs to go off
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,2,4,1000,1,4,0) ; deploys 8 archers

For $count = 0 To 27
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

; 2nd wave 25 secs total 16 barbs, 22 archers, works for TH partially covered by defenses _______________________________________________________________________________
SetLog("Attacking TH with 2nd wave of BARCH", $COLOR_BLUE)

AttackTHGridMod($eBarb,4,2,1000,2,4,0) ; deploys 8 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,2,5,1000,2,4,0) ; deploys 10 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,4,2,1000,2,4,0) ; deploys 8 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,4,3,1000,2,4,0) ; deploys 12 archers


For $count = 0 To 20
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

;---3nd wave 17 secs (rather short interval until ALL IN) total 2 giants, 30 barbs, 57 archers ______________________________________________________________________
SetLog("Oh Shit! Seems like a trapped TH!", $COLOR_BLUE)
AttackTHGridMod($eGiant,2,1,200,3,4,0) ; deploys 2 giants as meat shield
    If CheckOneStar() Then Return
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys king
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys queen
    If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys cc
    If CheckOneStar() Then Return
SpellTHGrid($eRSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,3,3,200,3,4,0) ; deploys 9 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,3,5,200,3,4,0) ; deploys 15 archers
	If CheckOneStar() Then Return
AttackTHGridMod($eBarb,3,3,200,3,4,0) ; deploys 9 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,3,6,200,3,4,0) ; deploys 18 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,4,3,200,3,4,0) ; deploys 12 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,4,6,200,3,4,0) ; deploys 24 archers
    If CheckOneStar() Then Return
SpellTHGrid($eHSpell)


For $count = 0 To 15
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

;---4th wave 20 secs throw in everything ______________________________________________________________________________________________________________________________
Setlog("Dammit! ALL IN!", $COLOR_BLUE)

AttackTHGridMod($eArch,2,10,100,4,4,0) ; deploys 20 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,2,10,100,4,4,0) ; deploys 20 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eGiant,3,10,100,4,4,0) ; deploys 30 giants
    If CheckOneStar() Then Return
AttackTHGridMod($eGobl,2,10,100,4,4,0) ; deploys 20 goblins
    If CheckOneStar() Then Return
AttackTHGridMod($eWiza,2,10,100,4,4,0) ; deploys 20 wizards
    If CheckOneStar() Then Return
AttackTHGridMod($eMini,2,10,100,4,4,0) ; deploys 20 minions
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,2,10,100,4,4,0) ; deploys 20 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,2,10,100,4,4,0) ; deploys 20 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,2,10,100,4,4,0) ; deploys 20 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,2,10,100,4,4,0) ; deploys 20 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,4,10,100,4,4,0) ; deploys 40 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,4,10,100,4,4,0) ; deploys 40 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,4,10,600,4,4,0) ; deploys 40 archers


SetLog("All troops deployed and waiting for a star...",$COLOR_BLUE)

For $count = 0 To 15
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

If _Sleep(100) Then Return
SetLog("~Finished Attacking, waiting to finish",$COLOR_GREEN)

EndFunc   ;==>AttackTHSmartBarch