//::///////////////////////////////////////////////
//:: Mage Armor
//:: op_s_magearmor.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Bard 1, Wizard / Sorcerer 1
    Innate Level: 1
    School: Conjuration
    Descriptor(s): Force
    Component(s): Verbal, Somatic
    Range: Touch
    Area of Effect / Target: Single
    Duration: 1 Hour / Level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    An invisible but tangible field of force surrounds the subject of mage armor, providing a +4 armor bonus to AC.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    effect eVis  = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eAC   = EffectACIncrease(4, AC_ARMOUR_ENCHANTMENT_BONUS);
    effect eDur  = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eAC, eDur);

    SignalSpellCastAt(oTarget, oCaster, FALSE);

    // Note we don't remove duplicate effects since the AC bonus won't stack since it's no longer dodge based

    // Apply the armor bonuses and the VFX impact
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
}
