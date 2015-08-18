
#include <GuiTab.au3>

#include "Config\readConfigMod.au3"
#include "Config\applyConfigMod.au3"
#include "Config\saveConfigMod.au3"

#include "GUIControl.au3" ;contains First control to disable
#include "ThSnipeAttacks\AttackTHGridMod.au3"
#include "ThSnipeAttacks\SwitchAttack.au3"
#include "ThSnipeAttacks\AttackTHMasterGiBAM.au3"
#include "ThSnipeAttacks\AttackTHSmartBarch.au3"
#include "ThSnipeAttacks\AttackTHWizard.au3"
#include "ThSnipeAttacks\AttackTHDragon.au3"
#include "ThSnipeAttacks\AttackTHBarchRider.au3"
#include "ThSnipeAttacks\AttackTHGbarchMod.au3"
#include "ThSnipeAttacks\AttackTHYourCustom.au3"
#include "ThSnipeAttacks\AttackBottomTHType.au3"
#include "ThSnipeAttacks\SnipeWhileTrain.au3"
#include "TrainSpells\TrainSpells.au3"
#include "FourFingersBarch\FourFingersBarch.au3"
#include "UpgradeHeros\UpgradeHeroes.au3"
#include "UpgradeHeros\LocateHeroes.au3"
#include "Remove Trees\ClearObstacles.au3"
#include "Remove Trees\isInsideBigDiamond.au3"
#include "SmartZap\DEDrillSearch.au3"
#include "SmartZap\DEDropSmartSpell.au3"
#include "HaltDark\isDarkElixirFull.au3"
#include "Stats\AdvancedStatsMod.au3" ;Contains last control to disable

#include "Stats\ControlStats.au3"
#include "AdditionalTHImages\checkTownhallSuper.au3"
#include "BetterWallFind\BetterWallFind.au3"

ShowGUI()

;Functions called at original bot files
Func BeforeUpgrades()
ShowThLvl()
SWHTrainRevertNormal()
DarkFullConditions()
UpgradeHeroes()
EndFunc


Func AtIdleEnd()
ClearObstacles()
SnipeWhileTrain()
EndFunc


Func AtOOS()
UpOOS()
EndFunc

Func AtTrainStart()
ReadResTrain()
EndFunc

Func AtTrainEnd()
GetArmyCost()
EndFunc


Func AtAttackReport()
UpgradeModStates()
UpZapStates()
;If $OptTrophyMode = 1 And _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 9 Then $FirstStart = False
EndFunc

Func AtSearchLoop($iSkipped)
SearchCost()
If SearchLimit($iSkipped) Then Return True
$Is_ClientSyncError = True
EndFunc

Func AtGetTHOutside()

If $searchTH = "-" Then
	$searchTH = checkTownhallADV()
EndIf

If $searchTH = "-" Then
	$searchTH = checkTownhallSuper()
EndIf

;If $searchTH = "-" Then btnMakeScreenshot()

EndFunc

Func AtReturnHome()
DEDropSmartSpell()
EndFunc

Func AtCheckWall()
If BetterWallFind() Then Return True
EndFunc