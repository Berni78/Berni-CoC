#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:    The Master

    Script Function: AttackTHMasterGiBAM
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

Func AttackTHMasterGiBAM()
;;;; Created by The Master with new modifications as adviced by susdu

Setlog("Sniping TH with Master GiBAM",0x9e3f1b)

;AttackTHGridMod($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)

; First Group ____________________________________________________________________________________________
Setlog("Small attack first to get totally unprotected townhall",0x9e3f1b)
AttackTHGridMod($eArch,3,3,2000,1,4,0) ; deploys 9 archers to get Unprotected townhall

For $count = 0 To 35
    If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

; Second Group ___________________________________________________________________________________________
 Setlog(" Not a clear townhall Going In Full Power with GiPAM pulse",0x9e3f1b)

AttackTHGridMod($eGiant,2,1,100,1,4,0) ; deploys 2 giants to Triger traps
	If CheckOneStar() Then Return
AttackTHGridMod($eGiant,5,4,100,2,4,0) ; deploys 20 giants To Protect PAM pulse
    If CheckOneStar() Then Return
SpellTHGrid($eHSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eWall,4,2,100,1,4,0) ; deploys up to 8 wallbreakers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,6,10,100,1,4,0) ; deploys 60 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys CC
    If CheckOneStar() Then Return
AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys King
    If CheckOneStar() Then Return
AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys Queen
    If CheckOneStar() Then Return
SpellTHGrid($eRSpell)
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,6,10,100,2,4,0) ; deploys 60 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eBarb,6,10,100,2,4,0) ; deploys 60 barbarians
    If CheckOneStar() Then Return
AttackTHGridMod($eArch,6,10,100,3,4,0) ; deploys 60 archers
    If CheckOneStar() Then Return
AttackTHGridMod($eHogs,5,2,100,2,4,0) ; deploys 10 Hogs To Protect PAM pulse
    If CheckOneStar() Then Return
AttackTHGridMod($eMini,5,2,100,1,1,0) ; deploys 10 minions

For $count = 0 To 10
	If CheckOneStar() Then Return
    If _Sleep(1000) Then Return
Next

; Final Group ____________________________________________________________________________________________
 Setlog("Heavily Protected sending in all Remaining Troops",0x9e3f1b)
SpellTHGrid($eHSpell)
    If CheckOneStar() Then Return
SpellTHGrid($eRSpell)
    If CheckOneStar() Then Return
 For $i = $eBarb To $eArch ; Deploy Remaining Barb,archers
 AttackTHGridMod($i,5,15,1000,0,4,0)
Next
If CheckOneStar() Then Return

For $i = $eGole To $eLava ; Deploy Remaining troops
 AttackTHGridMod($i,5,2,1000,0,4,0)
Next
If CheckOneStar() Then Return

For $i = $eGiant To $eValk ; Deploy Remaining troops
 AttackTHGridMod($i,6,5,1000,0,4,0)
Next

SetLog("All troops deployed and waiting for a star...",0x9e3f1b)

For $count = 0 To 60
	If CheckOneStar() Then Return
	If _Sleep(1000) Then Return
Next

If _Sleep(100) Then Return
 SetLog("~Finished Attacking, waiting to finish",0x9e3f1b)

EndFunc ;==>AttackTHMasterGiBAM