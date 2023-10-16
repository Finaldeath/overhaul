//::///////////////////////////////////////////////
//:: M3_ATTONEND5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Attack Nearest PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 25, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    AdjustReputation(oPC,OBJECT_SELF,-100);
    DetermineCombatRound(oPC);
    effect eFire=EffectVisualEffect(VFX_FNF_FIRESTORM);
    location lFire = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eFire,lFire);
    effect eDam = EffectDamage(100);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);
    effect eAC = EffectACDecrease(17,AC_NATURAL_BONUS);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAC, OBJECT_SELF);
}
