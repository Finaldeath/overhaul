//::///////////////////////////////////////////////
//:: Witchwork 1: Barrow Site Cinematic, Script #1
//:: WW1_BarrowCine_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launches the Barrow Site Cinematic.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    object oSpawnPoint = GetNearestObjectByTag("WP_InvisSpawn");
    location lSpawnPoint = GetLocation(oSpawnPoint);

    if (GetIsPC(oPC) == TRUE)
    {
        //Clear all effects
        RemoveEffects(oPC);

        //Put them in cutscene mode
        SetCutsceneMode(oPC);

        //Remove all effects again (in case of cutscene_ghost effects in multiplayer)
        //Remove all effects on the player.
        effect eEffect = GetFirstEffect(oPC);
        int iEffectType;
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            RemoveEffect(oPC, eEffect);

            //Update the loop variable
            eEffect = GetNextEffect(oPC);
        }

        //BlackScreen
        BlackScreen(oPC);

        //Set the initial camera facing.
        DelayCommand(1.0, SetCameraHeight(oPC, 3.5));
        DelayCommand(1.0, AssignCommand(oPC, SetCameraFacing(90.0, 3.0, 20.0)));

        //Spawn in the invisible conversation placeables for the player to keep
        //things multiplayer-friendly.
        //object oSteinfaar = CreateObject(OBJECT_TYPE_PLACEABLE, "SteinfaarInvis", lSpawnPoint);
        //object oBlauhart = CreateObject(OBJECT_TYPE_PLACEABLE, "BlauhartInvis", lSpawnPoint);
        //object oGreinlager = CreateObject(OBJECT_TYPE_PLACEABLE, "GreinlagerInvis", lSpawnPoint);
        object oPool = CreateObject(OBJECT_TYPE_PLACEABLE, "PoolInvis", lSpawnPoint);

        //Save them as local objects on the player in case they're needed later.
        //SetLocalObject(oPC, "oSteinfaar", oSteinfaar);
        //SetLocalObject(oPC, "oBlauhart", oBlauhart);
        //SetLocalObject(oPC, "oGreinlager", oGreinlager);
        SetLocalObject(oPC, "oPool", oPool);

        //Fade from black
        DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_SLOW));

        //Perform Camera movement...
        DelayCommand(3.0, AssignCommand(oPC, SetCameraFacing(270.0, 6.0, 75.0, 18)));

        //Start the cinematic conversation.
        DelayCommand(3.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(3.5, AssignCommand(oPC, ActionStartConversation(oPool, "", TRUE, FALSE)));
    }
}
