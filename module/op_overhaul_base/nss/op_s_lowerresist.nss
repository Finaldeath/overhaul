//::///////////////////////////////////////////////
//:: Lower Spell Resistance
//:: op_s_lowerresist.nss
//:://////////////////////////////////////////////
/*
    This spell reduces the subject's spell resistance by 1 per caster level
    (maximum reduction 15).

    The save DC gains a bonus equal to your caster level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nSRDecrease = min(15, nCasterLevel);

    effect eLink = EffectLinkEffects(EffectSpellResistanceDecrease(nSRDecrease),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    effect eVis  = EffectVisualEffect(VFX_IMP_BREACH);

    // Save DC gets a bonus
    nSpellSaveDC += nCasterLevel;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC))
        {
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, MINUTES));
        }
    }
}
