//:://////////////////////////////////////////////
//:: Monster Rages
//:: op_a_rage
//:://////////////////////////////////////////////
/*
    Ferocity (Improved / Greater)
    Intensity (Improved / Greater)
    Rage (Improved / Greater)

    Some creatures have the ability to enter a frenzied state that grants
    temporary ability score bonuses. This works in a similar fashion to
    Barbarian Rage. A creature can enter three different types of Frenzy
    available in the game, each of which has three versions that apply a +2,
    +4, or +6 bonus to ability scores. The duration of all forms of Frenzy is
    equal to the creature's Constitution modifier, in rounds. The three
    types are as follows:

    Ferocity: boosts Strength and Dexterity.
    Intensity: boosts Dexterity and Constitution.
    Rage: boosts Strength and Constitution.

    Note: Kept the duration of con modifier +1 round.

    Note: Fixed several bugs from the original scripts.

    Note: Not applying rage effects on top for now.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // We don't apply the rage again if we have it. This is for two good reasons:
    // - Players don't overuse their rage
    // - Constitution bonus shouldn't apply to the duration
    if (GetHasSpellEffect(SPELLABILITY_RAGE_3, oTarget))
    {
        // Replenish use and feedback
        IncrementRemainingSpellUses(oCaster, GetSpellId());
        FloatingTextStrRefOnCreature(STRREF_CANNOT_RAGE_WHILE_RAGING, oCaster, FALSE, TRUE);
        return;
    }

    // Simplified this to current constitution modifier + 1 round
    // Bioware coded some of them to be current modifier + new modifier...!
    float fDuration = GetDuration(max(1, GetAbilityModifier(ABILITY_CONSTITUTION, oCaster) + 1), ROUNDS);
    int nAbility1, nAbility2, nIncrease;

    switch (nSpellId)
    {
        case SPELLABILITY_RAGE_3: nAbility1 = ABILITY_STRENGTH; nAbility2 = ABILITY_CONSTITUTION; nIncrease = 3; break;
        case SPELLABILITY_RAGE_4: nAbility1 = ABILITY_STRENGTH; nAbility2 = ABILITY_CONSTITUTION; nIncrease = 6; break;
        case SPELLABILITY_RAGE_5: nAbility1 = ABILITY_STRENGTH; nAbility2 = ABILITY_CONSTITUTION; nIncrease = 9; break;
        case SPELLABILITY_FEROCITY_1: nAbility1 = ABILITY_STRENGTH; nAbility2 = ABILITY_DEXTERITY; nIncrease = 3; break;
        case SPELLABILITY_FEROCITY_2: nAbility1 = ABILITY_STRENGTH; nAbility2 = ABILITY_DEXTERITY; nIncrease = 3; break;
        case SPELLABILITY_FEROCITY_3: nAbility1 = ABILITY_STRENGTH; nAbility2 = ABILITY_DEXTERITY; nIncrease = 3; break;
        case SPELLABILITY_INTENSITY_1: nAbility1 = ABILITY_DEXTERITY; nAbility2 = ABILITY_CONSTITUTION; nIncrease = 3; break;
        case SPELLABILITY_INTENSITY_2: nAbility1 = ABILITY_DEXTERITY; nAbility2 = ABILITY_CONSTITUTION; nIncrease = 3; break;
        case SPELLABILITY_INTENSITY_3: nAbility1 = ABILITY_DEXTERITY; nAbility2 = ABILITY_CONSTITUTION; nIncrease = 3; break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_a_rage] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    SignalSpellCastAt();

    effect eLink = ExtraordinaryEffect(EffectLinkEffects(EffectAbilityIncrease(nAbility1, nIncrease),
                                       EffectLinkEffects(EffectAbilityIncrease(nAbility2, nIncrease),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));

    ApplyVisualEffectToObject(VFX_IMP_IMPROVE_ABILITY_SCORE, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

