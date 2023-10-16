//::///////////////////////////////////////////////
//:: Deadly Negative Energy Trap and healing undead
//:: q3c_t1_negdeadc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does 8d6 negative energy damage and the target
    must make a Fort save or take 1 negative level
    Undeads are healed 8d6 damage.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 22/1/2003 (edit - 30/10/2003 - removed negative level)
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"

void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    //effect eNeg = EffectNegativeLevel(1);
    int nDam = d6(4);
    effect eDam = EffectDamage(nDam, DAMAGE_TYPE_NEGATIVE);
    effect eHeal = EffectHeal(nDam);
    //eNeg = SupernaturalEffect(eNeg);
    effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
    effect eVis2 = EffectVisualEffect(VFX_IMP_HEALING_L);

    if(GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
         ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
         ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
         return;
    }
    //Make a saving throw check
    /*if(!MySavingThrow(SAVING_THROW_FORT, oTarget, 21, SAVING_THROW_TYPE_NEGATIVE))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eNeg, oTarget);
    }*/
    //Apply the VFX impact and effects
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}
