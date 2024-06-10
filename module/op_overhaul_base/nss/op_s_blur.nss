//::///////////////////////////////////////////////
//:: Blur
//:: op_s_blur
//:://////////////////////////////////////////////
/*
    The subject's outline appears blurred. This distortion grants the subject
    20% concealment.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink = EffectLinkEffects(EffectConcealment(20),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_BLUR),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    float fDuration = GetDuration(nCasterLevel, MINUTES);

    SignalSpellCastAt();

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

