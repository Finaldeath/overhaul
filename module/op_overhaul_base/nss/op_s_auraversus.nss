//::///////////////////////////////////////////////
//:: Aura versus Alignment
//:: op_s_auraversus.nss
//:://////////////////////////////////////////////
/*
    When this spell is cast, the caster chooses to be protected from either
    good or evil. He receives a +4 deflection bonus to Armor Class, immunity
    to mind-affecting spells and spell-like abilities used by creatures of the
    chosen alignment

    Additionally the caster gains spell resistance 25, and all creatures
    attacking the caster take 6 + 1d8 divine (if Holy Aura) or negative (if
    Unholy Aura) damage on a successful hit.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Depends on the version
    int nAlignment = nSpellId == SPELL_HOLY_AURA ? ALIGNMENT_GOOD : ALIGNMENT_EVIL;
    int nDamageType = nSpellId == SPELL_HOLY_AURA ? DAMAGE_TYPE_DIVINE : DAMAGE_TYPE_NEGATIVE;
    int nVFX = nSpellId == SPELL_HOLY_AURA ? VFX_DUR_PROTECTION_GOOD_MAJOR : VFX_DUR_PROTECTION_EVIL_MAJOR;

    effect eLink =
        EffectLinkEffects(VersusAlignmentEffect(EffectACIncrease(4, AC_DEFLECTION_BONUS), ALIGNMENT_ALL, nAlignment),
        EffectLinkEffects(VersusAlignmentEffect(EffectSavingThrowIncrease(SAVING_THROW_ALL, 4), ALIGNMENT_ALL, nAlignment),
        EffectLinkEffects(VersusAlignmentEffect(EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS), ALIGNMENT_ALL, nAlignment),
        EffectLinkEffects(EffectSpellResistanceIncrease(25),                    // Currently this doesn't work against alignment
        EffectLinkEffects(EffectDamageShield(6, DAMAGE_BONUS_1d8, nDamageType), // Currently this doesn't work against alignment
        EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE),
                          EffectVisualEffect(nVFX)))))));

    SignalSpellCastAt();

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
}

