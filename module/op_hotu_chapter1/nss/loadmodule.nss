//::///////////////////////////////////////////////
//:: moduleload
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script fires when the module loads.
    Used to setup various plots
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
//#include "x0_inc_portal"
#include "inc_plot_func"
//#include "inc_crowds"
#include "x0_inc_cuts"
#include "x2_inc_restsys"
#include "x2_inc_treasure"
#include "x2_inc_switches"

void main()
{
    // * Tell henchmen scripts we are in XP2
   SetLocalInt(GetModule(), "X2_L_XP2", TRUE);
   //Set the max henchmen to 3
   SetMaxHenchmen(3);

    // Enable Use Magic Device Skillcheck Rolls in Hardcore and Difficult Game Mode;
   if (GetGameDifficulty() ==  GAME_DIFFICULTY_CORE_RULES || GetGameDifficulty() ==  GAME_DIFFICULTY_DIFFICULT)
   {
       SetModuleSwitch (MODULE_SWITCH_ENABLE_UMD_SCROLLS, TRUE);
   }

   // Enable Item Creation Feats
   //SetModuleSwitch (MODULE_SWITCH_ENABLE_ITEM_CREATION_FEATS, TRUE);
    //Module Version
    SetLocalString(GetModule(),"NW_S_VERSION", "2.85");


    // * Check for a cutscene running after a game has
    // * been loaded. If so, then run the abort script
    // * for that cutscene.
    if (cutSceneIsOn() == TRUE)
    {
        // * the pc will run this particular cutscene
        cutSceneRunAbortScript(GetFirstPC());
        cutSceneOff();
    }

    if (GetLocalInt(OBJECT_SELF,"NW_L_SETUPAREA") == 0)
    {


        // Initialize DTS using the Row identified by 0 in des_conf_treas.2da
        DTSInitialize(0);

        SetLocalInt(OBJECT_SELF, "NW_L_SETUPAREA", 10);

    }

    //Setup for wandering monster system

    // Initialize Wandering Monster System 2da cache.
    WMBuild2DACache();


}
