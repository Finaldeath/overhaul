//::///////////////////////////////////////////////
//:: Name q2d8_transform
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Charming host transforms into monsters..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    //Variable for Brain's conversation
    SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 1);

    effect eVis1 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eVis2 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eLink = EffectLinkEffects(eVis1, eVis2);

    location lSpawn1 = GetLocation(OBJECT_SELF);
    location lSpawn2 = GetLocation(GetWaypointByTag("wp_q2d8_spawn1"));
    location lSpawn3 = GetLocation(GetWaypointByTag("wp_q2d8_spawn2"));


    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lSpawn2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lSpawn3);

    object oNew = CreateObject(OBJECT_TYPE_CREATURE, "q2d8spawn1", lSpawn1);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, GetLocation(oNew));

    DestroyObject(OBJECT_SELF, 0.3);
    object oNew2 = CreateObject(OBJECT_TYPE_CREATURE, "q2d8spawn2", lSpawn2);
    object oNew3 = CreateObject(OBJECT_TYPE_CREATURE, "q2d8spawn3", lSpawn3);

    AssignCommand(oNew, DetermineCombatRound());
    AssignCommand(oNew2, DetermineCombatRound());
    AssignCommand(oNew3, DetermineCombatRound());

}
