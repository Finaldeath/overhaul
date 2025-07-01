//::///////////////////////////////////////////////
//:: Divine Might and Divine Shield
//:: op_f_divine.nss
//:://////////////////////////////////////////////
/*
    Divine Might

    The character may spend one of his turn undead attempts to add his charisma
    bonus to all weapon damage for a number of rounds equal to the charisma
    bonus.

    Divine Shield

    The character may spend one of his turn undead attempts to add his charisma
    bonus to his armor class for a number of rounds equal to the charisma bonus.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Needs Turn Undead
    if (!GetHasFeat(FEAT_TURN_UNDEAD, oCaster))
    {
        FloatingTextStrRefOnCreature(40550, oCaster, FALSE); // This ability is tied to your turn undead ability, which has no more uses for today.
    }

    effect eLink;
    int nBonus = GetAbilityModifier(ABILITY_CHARISMA, oCaster);

    // NB: Added 1 more round to the duration so it's more usable (takes a round to cast)
    float fDuration = GetDuration(1 + nBonus, ROUNDS);

    switch (nSpellId)
    {
        case SPELL_DIVINE_MIGHT:
        {
            int nDamageBonus = GetDamageBonusValue(nBonus);
            eLink = SupernaturalEffect(EffectLinkEffects(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_DIVINE), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_DIVINE_SHIELD:
        {
            eLink = SupernaturalEffect(EffectLinkEffects(EffectACIncrease(nBonus), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("Invalid spell Id", ERROR);
            return;
        }
        break;
    }

    DecrementRemainingFeatUses(oCaster, FEAT_TURN_UNDEAD);

    SignalSpellCastAt();

    // Do not stack
    RemoveEffectsFromSpell(oTarget, nSpellId);

    ApplyVisualEffectToObject(VFX_IMP_SUPER_HEROISM, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

