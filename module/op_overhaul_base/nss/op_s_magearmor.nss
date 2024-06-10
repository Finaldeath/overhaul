//::///////////////////////////////////////////////
//:: Mage Armor and Greater Mage Armor
//:: op_s_magearmor.nss
//:://////////////////////////////////////////////
/*
    Mage Armor

    An invisible but tangible field of force surrounds the subject of mage
    armor, providing a +4 armor bonus to AC.

    Greater Mage Armor

    An invisible but tangible field of force surrounds the subject of mage
    armor, providing a +6 armor bonus to AC.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nAC = nSpellId == SPELL_GREATER_MAGE_ARMOR ? 6 : 4;

    effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eLink = EffectLinkEffects(EffectACIncrease(nAC, AC_ARMOUR_ENCHANTMENT_BONUS),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

    SignalSpellCastAt();

    // Note we don't remove duplicate effects since the AC bonus won't stack
    // since it's no longer dodge based. However a future change may make it
    // be removed so it is consistent with other spells (and so dispel magic
    // is more effective).

    // Apply the armor bonuses and the VFX impact
    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, HOURS));
}
