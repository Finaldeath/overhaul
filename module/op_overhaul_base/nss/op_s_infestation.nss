//::///////////////////////////////////////////////
//:: Infestation of Maggots
//:: op_s_infestation
//:://////////////////////////////////////////////
/*
    With but a touch, you infest a target with maggot-like creatures. If you
    succeed in a melee touch attack they hit the target and deal 1d4 points of
    Constitution damage each round. Each round the subject makes a new Fortitude
    save. The spell ends if the target succeeds at its saving throw,
    subsequently removing all the constition damage done.

    If the spell causes enough constitution damage to reach 3 or below it will
    kill the target on Hardcore rules or above.

    You cannot infest someone already infested. The infestation can be removed
    with a Cure Disease or Heal spell.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// This might save the concept of save vs. Spells. To test!
void RecurringEffect(string sID)
{
    int bValid = FALSE;
    effect eCheck = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectSpellId(eCheck) == nSpellId &&
            GetEffectLinkId(eCheck) == sID)
        {
            bValid = TRUE;
            break;
        }
        eCheck = GetNextEffect(oTarget);
    }

    if (bValid && !GetIsDead(oTarget))
    {
        if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_DISEASE) &&
            !DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_DISEASE))
        {
            ApplyVisualEffectToObject(VFX_IMP_DISEASE_S, oTarget);

            // 1d4 con damage
            effect eDamage = SetEffectSpellId(ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_CONSTITUTION, GetDiceRoll(1, 4))), SPELL_INVALID);
            // We use SetEffectSpellId so don't apply the main spell ID to this effect so it stacks
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamage, oTarget);

            // Death check (may move to a function later)
            if (GetAbilityScore(oTarget, ABILITY_CONSTITUTION) <= 3 &&
                GetGameDifficulty() >= GAME_DIFFICULTY_CORE_RULES)
            {
                if (!GetImmortal(oTarget))
                {
                    FloatingTextStrRefOnCreature(100932, oTarget); // * Death through ability damage *
                    ApplyDeathDamageToObject(oTarget, VFX_IMP_DEATH_L);
                }
            }
        }
        DelayCommand(6.0, RecurringEffect(sID));
    }
}

void main()
{
    if (DoSpellHook()) return;


    if (GetHasSpellEffect(nSpellId, oTarget))
    {
        FloatingTextStrRefOnCreature(100775, oCaster, FALSE); // Target already has this effect!
        return;
    }

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        if (DoTouchAttack(oTarget, oCaster, TOUCH_MELEE))
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                effect eDur = UnyieldingEffect(EffectVisualEffect(VFX_DUR_FLIES));
                string sID = GetEffectLinkId(eDur);

                // 10 Rounds + 1 Round / Level
                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eDur, oTarget, GetDuration(10 + nCasterLevel, ROUNDS));
                RecurringEffect(sID);
            }
        }
    }
}

