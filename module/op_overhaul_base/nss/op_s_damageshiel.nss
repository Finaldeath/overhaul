//::///////////////////////////////////////////////
//:: Damage Shield spells
//:: op_s_damageshiel.nss
//:://////////////////////////////////////////////
/*
    Death Armor

    1d4 + 1/2 caster levels negative damage.

    Wounding Whispers

    1d6 + 1 / level sonic damage.

    Elemental Shield

    1d6 + 1 / level fire damage. 50% immunity to fire and cold.

    Mestil's Acid Sheath

    1d6 + 1 / level acid damage, 50% immunity to acid.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDamageType, nVFX, nImmunity1 = -1, nImmunity2 = -1;

    int nStaticDamage = nCasterLevel;

    switch (nSpellId)
    {
        case SPELL_DEATH_ARMOR:
            nDamageType = DAMAGE_TYPE_NEGATIVE;
            nStaticDamage /= 2;
            if (nStaticDamage > 10) nStaticDamage = 10;
            nVFX = VFX_DUR_DEATH_ARMOR;
        case SPELL_WOUNDING_WHISPERS:
            nDamageType = DAMAGE_TYPE_SONIC;
            nVFX = VFX_DUR_MIND_AFFECTING_POSITIVE; // Really needs a new VFX
        break;
        case SPELL_ELEMENTAL_SHIELD:
            nDamageType = DAMAGE_TYPE_FIRE;
            nVFX = VFX_DUR_ELEMENTAL_SHIELD;
            nImmunity1 = DAMAGE_TYPE_COLD;
            nImmunity2 = DAMAGE_TYPE_FIRE;
        break;
        case SPELL_MESTILS_ACID_SHEATH:
            nDamageType = DAMAGE_TYPE_ACID;
            nVFX = VFX_DUR_PROT_ACIDSHIELD;
            nImmunity1 = DAMAGE_TYPE_ACID;
        break;
    }

    RemoveEffectsFromSpell(oTarget, SPELL_DEATH_ARMOR);
    RemoveEffectsFromSpell(oTarget, SPELL_WOUNDING_WHISPERS);
    RemoveEffectsFromSpell(oTarget, SPELL_ELEMENTAL_SHIELD);
    RemoveEffectsFromSpell(oTarget, SPELL_MESTILS_ACID_SHEATH);

    effect eLink = EffectLinkEffects(EffectDamageShield(nStaticDamage, DAMAGE_BONUS_1d6, nDamageType),
                   EffectLinkEffects(EffectVisualEffect(nVFX),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    // Optional immunities
    if (nImmunity1 >= 0) eLink = EffectLinkEffects(eLink, EffectDamageImmunityIncrease(nImmunity1, 50));
    if (nImmunity2 >= 0) eLink = EffectLinkEffects(eLink, EffectDamageImmunityIncrease(nImmunity2, 50));

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
}

