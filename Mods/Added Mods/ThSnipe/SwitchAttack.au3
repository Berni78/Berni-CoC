#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v2.0
    Author:   The Master

    Script Function: AttackTHType
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------------------------------------------------------------

; Adds moded attacks to GUI
GUICtrlSetPos ($cmbAttackTHType, 110  , Default , 120 , Default )
GUICtrlSetData($cmbAttackTHType, "Attack4:Wizards|Attack5:Dragons|Attack6:Smart Barch|Attack7:GiBaM|Attack8:Barch Rider|Attack9:Gbarch Modified|Attack10:All In|Attack11:Your Custom", "Attack7:GiBaM")

Func AttackTHType()

	If $TrappedAllIn = True Then
		$TrappedAllIn = False
		AttackTrappedTHAllIn()
		Return
	EndIf

		Switch $AttackTHType
			Case 0
				algorithmTH()
				If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then AttackTHNormal() ;if 'no' use another attack mode.
			Case 1
				AttackTHNormal();Good for Masters
			Case 2
				AttackTHXtreme();Good for Champ
			Case 3
				AttackTHGbarch() ;Good for Champ
			Case 4
                AttackTHWizard() ; Good for Master to Champ
		    Case 5
				AttackTHDragon() ; Good for Master to Champ
			Case 6
				AttackTHSmartBarch() ; Good for Low leagues only or ThSnipeWhileTrain
		    Case 7
		        AttackTHMasterGiBaM() ;Good For Master to Champ
			Case 8
				AttackTHBarchRider()
			case 9
                AttackTHGbarchMod()
			Case 10
				AttackTrappedTHAllIn()
			Case 11
				AttackTHYourCustom()
		EndSwitch
EndFunc


Func CheckOneStar()
;Check Heroes Health
CheckHeroesHealth()
;check for one star
If _ColorCheck(_GetPixelColor($aWonOneStar[0],$aWonOneStar[1], True), Hex($aWonOneStar[2], 6), $aWonOneStar[3]) Then ;exit if 1 star
SetLog("Townhall has been destroyed!",$COLOR_ORANGE)

;Activate King and Queen powers to restore health before exit if they are deployed
If $checkKPower = True Then
	SelectDropTroop($King)
    $checkKPower = False
EndIf

If $checkQPower = True Then
    SelectDropTroop($Queen)
	$checkQPower = False
EndIf

If _Sleep(1000) Then Return ;wait 1 seconds... antiban purpose...
Return True ;exit if you get a star
Else
Return False
EndIf
;end check for one star

EndFunc


