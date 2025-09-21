//::///////////////////////////////////////////////
//:: Barbarian Rage
//:: op_f_barbrage.nss
//:://////////////////////////////////////////////
/*
    The barbarian may rage, gaining a +4 morale bonus to Strength and
    Constitution and +2 to all Will saving throws, in exchange for a -2 penalty
    to Armor Class. At 15th level, the rage ability becomes greater rage, giving
    the barbarian +6 to Strength and Consitution and +3 to Will saves (the -2
    penalty to Armor Class still applies).

    Duration: The barbarian's constitution modifier (before the rage) plus 7
    rounds, plus an extra 2 rounds for greater rage.

    Changes from base game:
    * Instant feat usage
    * If you have the effects already we replenish the rage usage.
    * AC loss is "enemy attack bonus"
    * Mighty Rage and Eye of Gruumsh rage comes into the same script but we
      set the spell ID to be barbarian rage.

    Todo:
    * Rage VFX? Might feel a lot more impactful then...!
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    // We don't apply the rage again if we have it. This is for two good reasons:
    // - Players don't overuse their rage
    // - Constitution bonus shouldn't apply to the duration
    if (GetHasSpellEffect(SPELLABILITY_BARBARIAN_RAGE, oTarget))
    {
        // Replenish use and feedback
        if (GetSpellFeatId() != FEAT_INVALID)
            IncrementRemainingFeatUses(oCaster, GetSpellFeatId());
        FloatingTextStrRefOnCreature(STRREF_CANNOT_RAGE_WHILE_RAGING, oCaster, FALSE, TRUE); // *Cannot rage while raging! (use reset)*
        return;
    }

    // Check for feats other than this one being available to "use up"
    int nFeatId = GetSpellFeatId();
    if (nFeatId != FEAT_INVALID)
    {
        // We can identify the feat-chain used by the spell ID passed in
        if (nSpellId != SPELLABILITY_BARBARIAN_RAGE && GetHasFeat(FEAT_BARBARIAN_RAGE))
        {
            SendMessageToPCByStrRef(oCaster, STRREF_USING_UP_BARBARIAN_RAGE); // Using up Barbarian Rage.
            DecrementRemainingFeatUses(oCaster, FEAT_BARBARIAN_RAGE);
            IncrementRemainingFeatUses(oCaster, nFeatId);
        }
        else if (nSpellId != SPELLABILITY_EPIC_MIGHTY_RAGE && GetHasFeat(FEAT_MIGHTY_RAGE))
        {
            SendMessageToPCByStrRef(oCaster, STRREF_USING_UP_MIGHTY_RAGE); // Using up Mighty Rage.
            DecrementRemainingFeatUses(oCaster, FEAT_MIGHTY_RAGE);
            IncrementRemainingFeatUses(oCaster, nFeatId);
        }
        else if (nSpellId != SPELL_EYE_OF_GRUUMSH_RAGE && GetHasFeat(FEAT_EYE_OF_GRUUMSH_RAGE))
        {
            SendMessageToPCByStrRef(oCaster, STRREF_USING_UP_EYE_OF_GRUUMSH_RAGE); // Using up Eye of Gruumsh Rage.
            DecrementRemainingFeatUses(oCaster, FEAT_EYE_OF_GRUUMSH_RAGE);
            IncrementRemainingFeatUses(oCaster, nFeatId);
        }
    }

    // Set the spell ID to always be SPELLABILITY_BARBARIAN_RAGE since it can be used from
    // other feats now (like Mighty Rage) and it simplifies checking for it
    // earlier on in the script.
    nSpellId = SPELLABILITY_BARBARIAN_RAGE;

    SignalSpellCastAt();

    // Voicechat
    PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oCaster);

    int nIncrease;
    int nSave;

    // Mighty Rage
    if (GetHasFeat(FEAT_MIGHTY_RAGE))
    {
        nIncrease = 8;
        nSave = 4;
    }
    // Greater Rage
    else if (GetLevelByClass(CLASS_TYPE_BARBARIAN) +
             GetLevelByClass(CLASS_TYPE_EYE_OF_GRUUMSH) >= 15)
    {
        nIncrease = 4;
        nSave = 2;
    }
    // Normal Rage
    else
    {
        nIncrease = 6;
        nSave = 3;
    }

    // Determine the duration in rounds
    float fDuration = GetDuration(3 + GetAbilityModifier(ABILITY_CONSTITUTION) + nIncrease, ROUNDS);

    // If nRounds is not high enough, why bother?
    if (fDuration == 0.0)
    {
        FloatingTextStrRefOnCreature(STRREF_CANNOT_RAGE_WITH_NO_DURATION, oCaster, FALSE, TRUE); // *Cannot rage with no duration!*
        return;
    }

    // Strength and Constitution can differ
    int nConstitution = nIncrease;
    int nStrength = nIncrease;
    int nACDecrease = 2;

    if (GetHasFeat(FEAT_SWING_BLINDLY_EYE_OF_GRUUMSH))
    {
        nStrength += 4;
        nACDecrease += 4;
    }

    // Effects
    effect eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, nConstitution),
                   EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, nStrength),
                   EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, nSave),
                   EffectLinkEffects(EffectACDecrease(nACDecrease, AC_DODGE_BONUS),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));

    // Terrifying Rage feat
    if (GetHasFeat(FEAT_EPIC_TERRIFYING_RAGE, oCaster))
    {
        eLink = EffectLinkEffects(eLink, EffectAreaOfEffect(AOE_MOB_FEAR, "op_f_terrifyrage", "", ""));
    }

    // Make effect extraordinary
    eLink = ExtraordinaryEffect(eLink);

    // Make it uncurable
    eLink = EffectTagWithMetadata(eLink, TRUE);

    // Apply rage bonuses
    ApplyVisualEffectToObject(VFX_IMP_IMPROVE_ABILITY_SCORE, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);

    // Thundering Rage feat
    if (GetHasFeat(FEAT_EPIC_THUNDERING_RAGE, oCaster))
    {
        object oWeapon =  GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);

        itemproperty ipProperty1 = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d6);
        itemproperty ipProperty2 = ItemPropertyVisualEffect(ITEM_VISUAL_SONIC);
        itemproperty ipProperty3 = ItemPropertyOnHitProps(IP_CONST_ONHIT_DEAFNESS, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_ONHIT_DURATION_25_PERCENT_3_ROUNDS);

        if (GetIsObjectValid(oWeapon) && GetItemHasSpellCastOnIt(oWeapon, SPELLABILITY_BARBARIAN_RAGE))
        {
            if (GetCanApplySafeItemProperty(oTarget, ipProperty1)) ApplySafeItemProperty(oWeapon, ipProperty1, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
            if (GetCanApplySafeItemProperty(oTarget, ipProperty2)) ApplySafeItemProperty(oWeapon, ipProperty2, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
            if (GetCanApplySafeItemProperty(oTarget, ipProperty3)) ApplySafeItemProperty(oWeapon, ipProperty3, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
        }

        oWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);

        if (GetIsObjectValid(oWeapon) && GetItemHasSpellCastOnIt(oWeapon, SPELLABILITY_BARBARIAN_RAGE))
        {
            if (GetCanApplySafeItemProperty(oTarget, ipProperty1)) ApplySafeItemProperty(oWeapon, ipProperty1, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
            if (GetCanApplySafeItemProperty(oTarget, ipProperty2)) ApplySafeItemProperty(oWeapon, ipProperty2, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
            if (GetCanApplySafeItemProperty(oTarget, ipProperty3)) ApplySafeItemProperty(oWeapon, ipProperty3, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
        }
    }
}
