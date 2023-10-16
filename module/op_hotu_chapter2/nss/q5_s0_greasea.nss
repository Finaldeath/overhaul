//::///////////////////////////////////////////////
//:: Grease: On Enter
//:: NW_S0_GreaseA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creatures entering the zone of grease must make
    a reflex save or fall down.  Those that make
    their save have their movement reduced by 1/2.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Aug 1, 2001
//:://////////////////////////////////////////////

#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{



    //Declare major variables
    int nMetaMagic = GetMetaMagicFeat();
    effect eVis = EffectVisualEffect(VFX_IMP_SLOW);
    effect eSlow = ExtraordinaryEffect(EffectMovementSpeedDecrease(50));
    effect eLink = EffectLinkEffects(eVis, eSlow);
    object oTarget = GetEnteringObject();
    int nAppear = GetAppearanceType(oTarget);
    if(GetHasEffect(EFFECT_TYPE_MOVEMENT_SPEED_DECREASE, oTarget))
            return; // do not apply the effect twice

    if(!spellsIsFlying(oTarget))
    {
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_INVALID, SPELL_GREASE));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSlow, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    }
}
