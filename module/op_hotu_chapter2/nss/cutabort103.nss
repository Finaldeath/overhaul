//::///////////////////////////////////////////////
//:: Name cutabort103
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of betrayal of the rebels cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 9/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
#include "x2_inc_globals"
void SpawnInCutsceneCreatures();
void CleanUpArea();
void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);

    object oPriest =  GetObjectByTag("cut103_drowpriest");

    location lPCTeleport = GetLocation(GetWaypointByTag("wp_cut102_pcstart"));
    BlackScreen(oPC);
    FadeFromBlack(oPC, FADE_SPEED_FAST);

    CleanUpArea();
    SpawnInCutsceneCreatures();
    //Set area friendly to PC
    object oArea = GetArea(oPC);
    object oFirst = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oFirst) == TRUE)
    {
        if (GetObjectType(oFirst) == OBJECT_TYPE_CREATURE)
        {
            SetIsTemporaryFriend(oPC, oFirst);
        }
        oFirst = GetNextObjectInArea(oArea);
    }

    AssignCommand(oPriest, ActionStartConversation(oPC, "bat1_betrayconv"));

}

//Destroy All creatures in the area (except henchmen)
void CleanUpArea()
{
    object oArea = GetObjectByTag("q2a_city1");

    object oReb1 = GetObjectByTag("cut103_reb1_1");
    object oReb2 = GetObjectByTag("cut103_reb1_2");
    object oReb3 = GetObjectByTag("cut103_reb1_3");
    object oReb4 = GetObjectByTag("cut103_reb1_4");
    object oReb5 = GetObjectByTag("cut103_reb2_1");
    object oReb6 = GetObjectByTag("cut103_reb2_2");
    object oReb7 = GetObjectByTag("cut103_reb2_3");
    object oReb8 = GetObjectByTag("cut103_reb2_4");
    object oFist = GetObjectByTag("cut103_fist");
    object oImloth = GetObjectByTag("q2aherald");
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oValen = GetObjectByTag("x2_hen_valen");

    //Take care of the two drow henchmen
    object oMaster1 = GetMaster(oNathyrra);
    if (GetIsObjectValid(oMaster1) == TRUE)
    {
        FireHenchman(oMaster1, oNathyrra);
    }
    object oMaster2 = GetMaster(oValen);
    if (GetIsObjectValid(oMaster2) == TRUE)
    {
        FireHenchman(oMaster2, oValen);
    }
    AssignCommand(oNathyrra, SetIsDestroyable(TRUE));
    AssignCommand(oValen, SetIsDestroyable(TRUE));
    DestroyObject(oNathyrra);
    DestroyObject(oValen);


    AssignCommand(oReb1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb1));
    AssignCommand(oReb2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb2));
    AssignCommand(oReb3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb3));
    AssignCommand(oReb4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb4));
    AssignCommand(oReb5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb5));
    AssignCommand(oReb6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb6));
    AssignCommand(oReb7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb7));
    AssignCommand(oReb8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oReb8));
    AssignCommand(oImloth, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oImloth));
    AssignCommand(oFist, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oFist));
}

//Spawn in all needed creatures for cutscene 103
void SpawnInCutsceneCreatures()
{

    //LOCATIONS
    location lDrowSpawn1_1 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_1"));
    location lDrowSpawn1_2 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_2"));
    location lDrowSpawn1_3 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_3"));
    location lDrowSpawn1_4 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_4"));
    location lDrowSpawn1_5 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto1_5"));

    location lDrowSpawn2_1 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_1"));
    location lDrowSpawn2_2 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_2"));
    location lDrowSpawn2_3 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_3"));
    location lDrowSpawn2_4 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_4"));
    location lDrowSpawn2_5 = GetLocation(GetWaypointByTag("wp_bat1_rebmoveto2_5"));

    location lDrowSpawnPriest = GetLocation(GetWaypointByTag("cut103wp_drowspawn_priest"));

        //NPCs needed for cutscene 103.

    //Drow Battle Priest
    object oPriest = GetObjectByTag("cut103_drowpriest");
    object oPC = GetLastPCToCancelCutscene();

    //Drow Troops.
    object oDuergar1_1 = GetObjectByTag("cut103_duergar1_1");
    object oDuergar1_2 = GetObjectByTag("cut103_duergar1_2");
    object oDuergar1_3 = GetObjectByTag("cut103_duergar1_3");
    object oDuergar1_4 = GetObjectByTag("cut103_duergar1_4");
    object oDuergar1_5 = GetObjectByTag("cut103_duergar1_5");

    object oDuergar2_1 = GetObjectByTag("cut103_duergar2_1");
    object oDuergar2_2 = GetObjectByTag("cut103_duergar2_2");
    object oDuergar2_3 = GetObjectByTag("cut103_duergar2_3");
    object oDuergar2_4 = GetObjectByTag("cut103_duergar2_4");
    object oDuergar2_5 = GetObjectByTag("cut103_duergar2_5");

    AssignCommand(oDuergar1_1, JumpToLocation(lDrowSpawn1_1));
    AssignCommand(oDuergar1_2, JumpToLocation(lDrowSpawn1_2));
    AssignCommand(oDuergar1_3, JumpToLocation(lDrowSpawn1_3));
    AssignCommand(oDuergar1_4, JumpToLocation(lDrowSpawn1_4));
    AssignCommand(oDuergar1_5, JumpToLocation(lDrowSpawn1_5));

    AssignCommand(oDuergar2_1, JumpToLocation(lDrowSpawn2_1));
    AssignCommand(oDuergar2_2, JumpToLocation(lDrowSpawn2_2));
    AssignCommand(oDuergar2_3, JumpToLocation(lDrowSpawn2_3));
    AssignCommand(oDuergar2_4, JumpToLocation(lDrowSpawn2_4));
    AssignCommand(oDuergar2_5, JumpToLocation(lDrowSpawn2_5));

    AssignCommand(oPriest, JumpToLocation(GetLocation(oPC)));
    //OPTIONAL BIT IF MATRON STILL HAS UNDEAD IN HER ARMY
    if (GetGlobalInt("x2_plot_undead_out") == 0)
    {
        //Create an undead battle group
        location lUndead1_1 = GetLocation(GetWaypointByTag("cut103wp_undeadspawn1_1"));
        location lUndead1_2 = GetLocation(GetWaypointByTag("cut103wp_undeadspawn1_2"));

        object oUndead1_1 = GetObjectByTag("cut103_undead1_1");
        object oUndead1_2 = GetObjectByTag("cut103_undead1_2");
    }

}
