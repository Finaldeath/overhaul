//::///////////////////////////////////////////////
//:: Displacement
//:: op_s_displacemen
//:://////////////////////////////////////////////
/*
    The target gains 50% concealment, displacing the caster's image several feet
    to the side, similar to the abilities of a displacer beast.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink = EffectLinkEffects(EffectConcealment(50),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_DISPLACEMENT),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    float fDuration = GetDuration(nCasterLevel, ROUNDS);

    SignalSpellCastAt();

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

