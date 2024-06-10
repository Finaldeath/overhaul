//::///////////////////////////////////////////////
//:: Assay Resistance
//:: op_s_assayresist.nss
//:://////////////////////////////////////////////
/*
    This spell enables you to divine the exact nature and vulnerabilities of a
    single creature's magical defenses, giving solely you a +10 bonus on caster
    level checks to overcome its spell resistance.

    Casting this again will replace the creature affected with the new target,
    or refresh the duration if on the same target.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // TODO: New effect icon just a copy of the spell icon
    effect eLink =
        EffectLinkEffects(EffectIcon(EFFECT_ICON_ARCANE_SPELL_FAILURE_GOOD),
        EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE),
                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
    // We use the effect tag to identify the object affected
    eLink = TagEffect(eLink, ObjectToString(oTarget));

    effect eVis = EffectVisualEffect(VFX_IMP_BREACH);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        // Remove existing castings
        RemoveEffectsFromSpell(oCaster, nSpellId);

        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oCaster, GetDuration(nCasterLevel, ROUNDS));
    }
}

