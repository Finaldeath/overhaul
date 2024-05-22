//::///////////////////////////////////////////////
//:: Epic Mage Armor
//:: op_f_epicmagearm.nss
//:://////////////////////////////////////////////
/*
    Type of Feat: Epic Spell
    Prerequisite: 21st level, the ability to cast 9th level spells and 26 ranks in spellcraft.
    Specifics: The caster gets a +20 armor AC enchantment bonus.
    Use: Cast.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eAC   = EffectACIncrease(20, AC_ARMOUR_ENCHANTMENT_BONUS);
    effect eDur  = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eDur2  = EffectVisualEffect(VFX_DUR_PROT_EPIC_ARMOR);
    effect eLink = EffectLinkEffects(eAC, eDur);
    eLink = EffectLinkEffects(eLink, eDur2);

    // Cannot be dispelled but lost on rest
    eLink = ExtraordinaryEffect(eLink);

    SignalSpellCastAt();

    // Note we don't remove duplicate effects since the AC bonus won't stack since it's no longer dodge based

    // Apply the armor bonuses and the VFX impact
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
}

