//::///////////////////////////////////////////////
//:: Name q2d4_ent_rendtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Create Illusionary Dragon
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 13/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "x2_inc_globals"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    if (GetGlobalInt("X2_Q2DOvermind") != 0)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    //Create 4 Illusionary Renders
    effect eSpawn = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    int nSpawn;
    location lSpawn;
    object oRender;
    for (nSpawn = 1; nSpawn < 5; nSpawn++)
    {
        lSpawn = GetLocation(GetWaypointByTag("wp_q2d4_greyspn" + IntToString(nSpawn)));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpawn, lSpawn);
        oRender = CreateObject(OBJECT_TYPE_CREATURE, "q2d4_illrender", lSpawn, TRUE);
        AssignCommand(oRender, DetermineCombatRound());
    }
    //and one real one
    lSpawn = GetLocation(GetWaypointByTag("wp_q2d4_greyspn5"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpawn, lSpawn);
    oRender = CreateObject(OBJECT_TYPE_CREATURE, "q2d4_illrender1", lSpawn, TRUE);
    AssignCommand(oRender, DetermineCombatRound());


}
