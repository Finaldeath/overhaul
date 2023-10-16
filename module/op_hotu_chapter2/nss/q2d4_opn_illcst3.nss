//::///////////////////////////////////////////////
//:: Name q2d4_opn_illcst3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Openning the Chest dispels it - its an illusion -
    and spawns in some Intellect devourers behind the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    location lSpawn1 = GetLocation(GetNearestObjectByTag("wp_q2d4devspawn1"));
    location lSpawn2 = GetLocation(GetNearestObjectByTag("wp_q2d4devspawn2"));
    location lVfx = GetLocation(OBJECT_SELF);
    effect eVis1 = EffectVisualEffect(VFX_FNF_PWSTUN);
    effect eVis2 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    effect eLink = EffectLinkEffects(eVis1, eVis2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lVfx);

    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    FloatingTextStrRefOnCreature(85718, oPC, FALSE);

    DestroyObject(OBJECT_SELF, 0.5);
    object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "q2d4baddog", lSpawn1);
    object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "q2d4baddog", lSpawn2);
    AssignCommand(oDog1, DetermineCombatRound());
    AssignCommand(oDog2, DetermineCombatRound());

}
