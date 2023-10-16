//::///////////////////////////////////////////////
//:: Acid Fog: On Enter
//:: NW_S0_AcidFogA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All creatures within the AoE take 2d6 acid damage
    per round and upon entering if they fail a Fort Save
    their movement is halved.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 17, 2001
//:://////////////////////////////////////////////

#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{
    int nDamage;
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
    effect eSlow = EffectMovementSpeedDecrease(50);
    object oTarget = GetEnteringObject();
    float fDelay = GetRandomDelay(1.0, 2.2);
    nDamage = d6(3);
    if(!MySavingThrow(SAVING_THROW_FORT, oTarget, 24, SAVING_THROW_TYPE_ACID, GetAreaOfEffectCreator(), fDelay))
           ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSlow, oTarget);
    eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));

}
