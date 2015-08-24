#cs ----------------------------------------------------------------------------
    AutoIt Version: 3.3.6.1
    This file was made to software CoCgameBot v4.x
    Author:  The Master

    Script Function: Control GUI For remote addition of mods
 CoCgameBot is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
 CoCgameBot is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with CoCgameBot.  If not, see ;<http://www.gnu.org/licenses/>.
 #ce ----------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; Include Mod Files ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include <AutoItConstants.au3>
#include <GuiTab.au3>
;Error Handle
#include "Added Mods\GlobalErrorHandle\ErrorHandle.au3"
;Global variables
#include "Global Variables Mod.au3"

;______________________________________________________________________________________________________________________________________________________________________

;;;;;;;;;;;;;;;;;;;;;;;; Config ( saves Your configuration );;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include "Config\readConfigMod.au3"
#include "Config\applyConfigMod.au3"
#include "Config\saveConfigMod.au3"
;;;;;;;;;;;;;;;;;;;;;;;; End Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;_______________________________________________________________________________________________________________________________________________________________________

;;;;;;;;;;;; GUI Design Here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#include "GUIControl.au3" ;Contains First control to disable
#include "Added Mods\ImportExportSettings\ImportExportSettings.au3"
#include "Added Mods\TrainSpells\TrainSpells.au3"
#include "Added Mods\UpgradeHeros\GUI.au3"
#include "Added Mods\ThSnipe\GUI.au3"
#include "Added Mods\SmartZap\GUI.au3"
#include "Added Mods\SaveTroops\SaveTroops.au3"
#include "Added Mods\Stats\AdvancedStatsMod.au3" ;Contains last control to disable
;;;;;;;;;;;; End GUI Design ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;_______________________________________________________________________________________________________________________________________________________________________


;Th Snip Mods Here
#include "Added Mods\ThSnipe\AttackTHGridMod.au3"
#include "Added Mods\ThSnipe\SpellTHGridMod.au3"
#include "Added Mods\ThSnipe\SwitchAttack.au3"
#include "Added Mods\ThSnipe\AttackBottomTHType\AttackBottomTHType.au3"
#include "Added Mods\ThSnipe\SnipeWhileTrain\SnipeWhileTrain.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHMasterGiBAM.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHSmartBarch.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHWizard.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHDragon.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHBarchRider.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHGbarchMod.au3"
#include "Added Mods\ThSnipe\ThSnipeAttacks\AttackTHYourCustom.au3"
#include "Added Mods\ThSnipe\TrappedTownhall\checkDefense.au3"
#include "Added Mods\ThSnipe\TrappedTownhall\TrappedTownhall.au3"
#include "Added Mods\ThSnipe\AdditionalTHImages\checkTownhallSuper.au3"
;End Th Snipe Mods


#include "Added Mods\Stats\ControlStats.au3"
#include "Added Mods\BetterWallFind\BetterWallFind.au3"
#include "Added Mods\UpgradeHeros\UpgradeHeroes.au3"
#include "Added Mods\UpgradeHeros\LocateHeroes.au3"
#include "Added Mods\Remove Trees\isInsideBigDiamond.au3"
#include "Added Mods\Remove Trees\ClearObstacles.au3"
#include "Added Mods\FourFingersBarch\FourFingersBarch.au3"
#include "Added Mods\SmartZap\DEDrillSearch.au3"
#include "Added Mods\SmartZap\DEDropSmartSpell.au3"
#include "Added Mods\HaltDark\isDarkElixirFull.au3"
#include "Added Mods\Training Order\Training Order.au3"



ShowGUI()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Functions Called At Original Bot Files ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Func BeforeUpgrades()
$CoRunCounter = 0
ShowThLvl()
SWHTrainRevertNormal()
DarkFullConditions()
UpgradeHeroes()
EndFunc


Func AtIdleEnd()
ClearObstacles()
SnipeWhileTrain()
EndFunc

Func AtEndTrainLine()
	TrainSpells()
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

TrappedTHCond()

EndFunc

Func AtReturnHome()
DEDropSmartSpell()
EndFunc

Func AtCheckWall()
If BetterWallFind() Then Return True
EndFunc

Func AtTrueCheckMain()
PutBSOnTOP()
EndFunc

Func AtAttackAllTroops( $King , $Queen , $CC )
IsFourFingersDeploy( $King , $Queen , $CC )
SmartSaveTroops( $King , $Queen , $CC )
EndFunc