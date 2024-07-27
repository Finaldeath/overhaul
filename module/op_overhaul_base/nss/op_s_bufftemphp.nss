//::///////////////////////////////////////////////
//:: Temp HP Spells
//:: op_s_bufftemphp.nss
//:://////////////////////////////////////////////
/*
    These apply temp HP. Need some special sauce to keep the temp HP separate,
    so it doesn't clear all the other buffs when lost, but dispellable. Use
    EffectRunScript.

    Aid
    +1 bonus to attack rolls, a +1 bonus on saving throws versus fear,
    and a 1d8 bonus to maximum hit points. 1 minute/level.

    Divine Power
    1 extra Hit Point per caster level, Strength is raised to 18 (if their
    strength is already 18 or higher, it is not raised further), and base
    attack bonus improves to that of a Fighter of the same level.
    1 round/level.

    Tenser's Transformation
    The caster becomes an engine of destruction, gaining 1d6 temporary hit
    points per caster level, a +4 natural armor AC bonus, a +2d4 Strength
    enchantment bonus, a +2d4 Dexterity enchantment bonus, a +1 attack bonus per
    two caster levels (which may give the character an extra attack), +5
    Fortitude saving throw bonus, and proficiency in all simple and martial
    weapons. The caster also is unable to cast spells, having 100% spell
    failure, and cannot use spell casting items (wands, potions, etc.).
    1 round/level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int bDelayRandom = FALSE;
    int nImpact = VFX_INVALID, nVis = VFX_INVALID;
    int nRemoveSpell1 = SPELL_INVALID, nRemoveSpell2 = SPELL_INVALID, nRemoveSpell3 = SPELL_INVALID;
    int nCreatureLimit = 99999;
    effect eLink, eTempHP;
    float fDuration;

    switch (nSpellId)
    {
        case SPELL_AID:
        {
            nVis      = VFX_IMP_HOLY_AID;
            eTempHP   = ExtraordinaryEffect(EffectTemporaryHitpoints(GetDiceRoll(1, 8)));
            eLink     = EffectLinkEffects(EffectRunScriptEnhanced(FALSE, "op_rs_removespel"),
                                          EffectLinkEffects(EffectAttackIncrease(1),
                                                            EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR),
                                                                              EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
            fDuration = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_DIVINE_POWER:
        {
            int nStrengthIncrease = 18 - GetAbilityScore(oTarget, ABILITY_STRENGTH, TRUE);
            int nAttackIncrease;
            int nBonusAttacks;

            // Sort the BAB and attack bonus
            int nTotalCharacterLevel = GetHitDice(oTarget);
            int nBAB                 = GetBaseAttackBonus(oTarget);
            int nEpicPortionOfBAB    = (nTotalCharacterLevel - 19) / 2;

            if (nEpicPortionOfBAB < 0)
            {
                nEpicPortionOfBAB = 0;
            }
            if (nTotalCharacterLevel > 20)
            {
                nAttackIncrease = 20 + nEpicPortionOfBAB;
                if (nBAB - nEpicPortionOfBAB < 11)
                {
                    nBonusAttacks = 2;
                }
                else if (nBAB - nEpicPortionOfBAB > 10 && nBAB - nEpicPortionOfBAB < 16)
                {
                    nBonusAttacks = 1;
                }
            }
            else
            {
                nAttackIncrease = nTotalCharacterLevel;
                nBonusAttacks   = ((nTotalCharacterLevel - 1) / 5) - ((nBAB - 1) / 5);
            }
            nAttackIncrease -= nBAB;

            nVis    = VFX_IMP_SUPER_HEROISM;
            eTempHP = ExtraordinaryEffect(EffectTemporaryHitpoints(nCasterLevel));
            eLink   = EffectLinkEffects(EffectRunScriptEnhanced(FALSE, "op_rs_removespel"),
                                        EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

            if (nStrengthIncrease > 0) eLink = EffectLinkEffects(eLink, EffectAbilityIncrease(ABILITY_STRENGTH, nStrengthIncrease));
            if (nAttackIncrease > 0) eLink = EffectLinkEffects(eLink, EffectAttackIncrease(nAttackIncrease));
            if (nBonusAttacks > 0)
            {
                eLink = EffectLinkEffects(eLink, EffectIcon(EFFECT_ICON_MODIFY_ATTACKS_INCREASED));
                eLink = EffectLinkEffects(eLink, EffectModifyAttacks(nBonusAttacks));
            }
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_TENSERS_TRANSFORMATION:
        {
            // Similar to Divine Power but different...
            /*
                Tenser's Transformation
                The caster becomes an engine of destruction, gaining 1d6 temporary hit
                points per caster level, a +4 natural armor AC bonus, a +2d4 Strength
                enchantment bonus, a +2d4 Dexterity enchantment bonus, a +1 attack bonus per
                two caster levels (which may give the character an extra attack), +5
                Fortitude saving throw bonus, and proficiency in all simple and martial
                weapons. The caster also is unable to cast spells, having 100% spell
                failure, and cannot use spell casting items (wands, potions, etc.).
            */
            int nStrengthIncrease  = GetDiceRoll(2, 4);
            int nDexterityIncrease = GetDiceRoll(2, 4);
            int nAttackIncrease    = max(1, nCasterLevel / 2);
            int nBonusAttacks;

            // Sort the BAB and attack bonus
            int nBAB              = GetBaseAttackBonus(oTarget);
            int nNewBAB           = nBAB + nAttackIncrease;
            int nEpicPortionOfBAB = (nNewBAB - 19) / 2;

            if (nEpicPortionOfBAB < 0)
            {
                nEpicPortionOfBAB = 0;
            }
            if (nNewBAB > 20)
            {
                if (nBAB - nEpicPortionOfBAB < 11)
                {
                    nBonusAttacks = 2;
                }
                else if (nBAB - nEpicPortionOfBAB > 10 && nBAB - nEpicPortionOfBAB < 16)
                {
                    nBonusAttacks = 1;
                }
            }
            else
            {
                nBonusAttacks = ((nNewBAB - 1) / 5) - ((nBAB - 1) / 5);
            }

            nVis    = VFX_IMP_SUPER_HEROISM;
            eTempHP = ExtraordinaryEffect(EffectTemporaryHitpoints(GetDiceRoll(nCasterLevel, 6)));
            eLink   = EffectLinkEffects(EffectRunScriptEnhanced(FALSE, "op_rs_removespel"),
                                        EffectLinkEffects(EffectSpellFailure(100),
                                                          EffectLinkEffects(EffectBonusFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE),
                                                                            EffectLinkEffects(EffectBonusFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL),
                                                                                              EffectLinkEffects(EffectIcon(EFFECT_ICON_BONUS_FEAT),
                                                                                                                EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_FORT, 5),
                                                                                                                                  EffectLinkEffects(EffectACIncrease(4, AC_NATURAL_BONUS),
                                                                                                                                                    EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))))));

            if (nStrengthIncrease > 0) eLink = EffectLinkEffects(eLink, EffectAbilityIncrease(ABILITY_STRENGTH, nStrengthIncrease));
            if (nDexterityIncrease > 0) eLink = EffectLinkEffects(eLink, EffectAbilityIncrease(ABILITY_DEXTERITY, nDexterityIncrease));
            if (nAttackIncrease > 0) eLink = EffectLinkEffects(eLink, EffectAttackIncrease(nAttackIncrease));
            if (nBonusAttacks > 0)
            {
                eLink = EffectLinkEffects(eLink, EffectIcon(EFFECT_ICON_MODIFY_ATTACKS_INCREASED));
                eLink = EffectLinkEffects(eLink, EffectModifyAttacks(nBonusAttacks));
            }
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        default:
            Debug("[op_s_buffs] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray) && nCreatureLimit > 0; nIndex++)
    {
        nCreatureLimit--;

        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = bDelayRandom ? GetRandomDelay() : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Remove previous castings
        RemoveEffectsFromSpell(oTarget, nSpellId);
        if (nRemoveSpell1 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell1);
        if (nRemoveSpell2 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell2);
        if (nRemoveSpell3 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell3);

        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eTempHP, oTarget, fDuration));
        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
    }
}
