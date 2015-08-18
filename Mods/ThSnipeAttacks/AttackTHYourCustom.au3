#cs
:::::::::::::::::::::::::::::::::::
::Design your own th snipe Attack::
:::::::::::::::::::::::::::::::::::

AttackTHGridMod($troopKind, $spots, $numperspot, $Sleep, $waveNb, $maxWaveNb, $BoolDropHeroes)
attack th with troops command
____________________________
$troopKind : type of troop to use
Accepted values : $eBarb, $eArch, $eGiant, $eGobl, $eWall, $eBall, $eWiza, $eHeal, $eDrag, $ePekk, $eMini, $eHogs, $eValk, $eGole, $eWitc, $eLava, $eKing, $eQueen, $eCastle, $eLSpell, $eHSpell, $eRSpell, $eJSpell, $eFSpell, $ePSpell, $eESpell, $eHaSpell
____________________________
$spots : the number of spots the troops are deployed in
$numperspot : the number of troops in each spot
Total number of troops = $spots * $numperspot
____________________________
$Sleep : delay after deploying the wave in miliseconds
ex 1000 is 1sec
____________________________
$waveNb
$maxWaveNb
		If $waveNb = 1 Then waveName = "first"
		If $waveNb = 2 Then waveName = "second"
		If $waveNb = 3 Then waveName = "third"
		If $maxWaveNb = 1 Then waveName = "only"
		If $waveNb = 0 Then waveName = "last"
WaveName will be diplayed to user in log
____________________________
$BoolDropHeroes
deploys heros and cc if 1 and dont deploy if 0
____________________________
EX:
AttackTHGridMod($eGiant,5,4,1000,2,4,0) ; deploys 20 giants in 5 spots at 4 very fast Waves
with wave name second Wave and no drop of heros
____________________________
EX:
AttackTHGridMod($eHogs,2,3,1000,3,1,1) ; deploys 6 Hogs in 2 spots at 3 very fast waves
with wave name last wave and droping heros and cc
____________________________
    CheckOneStar()
;checks for one star and end attack put it between every 2 AttackTHGridMod lines

____________________________

AttackTHGridMod($eKing,1,1,100,4,1,0) ; deploys king
 AttackTHGridMod($eQueen,1,1,100,4,1,0) ; deploys Queen
 AttackTHGridMod($eCastle,1,1,100,4,1,0) ; deploys CC
 SpellTHGrid($eRSpell) ; deploys Rage spell
 SpellTHGrid($eLSpell) ; deploys Lightning spell
 SpellTHGrid($eHSpell) ; deploys Heal spell
 SpellTHGrid($eJSpell) ; deploys Jump spell
 SpellTHGrid($eFSpell) ; deploys Freeze spell
 SpellTHGrid($ePSpell) ; deploys Poison spell
 SpellTHGrid($eESpell) ; deploys Earthquake spell
 SpellTHGrid($eHaSpell) ; deploys Haste spell

____________________________
see MasterGiBAM.au3 to understand more on how design your own th attack
#ce





Func AttackTHYourCustom()
;Put your code in the line below this line






















EndFunc