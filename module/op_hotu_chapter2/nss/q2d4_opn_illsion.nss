//::///////////////////////////////////////////////
//:: Name q2d4_opn_illsion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dispel the illusionary placeable...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////

void main()
{
    //location lSpawn = GetLocation(GetNearestObjectByTag("wp_q2d4chestspawn"));
    location lVfx = GetLocation(OBJECT_SELF);
    effect eVis1 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eVis2 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    effect eLink = EffectLinkEffects(eVis1, eVis2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lVfx);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    FloatingTextStrRefOnCreature(85718, oPC, FALSE);

    DestroyObject(OBJECT_SELF, 0.5);
    //CreateObject(OBJECT_TYPE_CREATURE, "x2_mindflayer002", lSpawn);
}
