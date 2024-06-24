//::///////////////////////////////////////////////
//:: Cure Effects spells
//:: op_s_cureeffects.nss
//:://////////////////////////////////////////////
/*
    A compilation of spells that cure/remove effects (and sometimes block them).
    This allows us to make sure certain effects are NOT cleared in all cases.

    Some notes:

    * Need to get effect tagging sorted so we can easily retrieve "this effect
      should not be cured"
    * Anything that removes ability score penalties inherently remove the
      effects of disease and poison. Vice versa anything removing
      poison and disease clears the ability score damage from other effects.
      How can we deal with this?
      - Engine changes (eg making those ability penalties get tagged/marked
        as from poison)
      - Tagging everything we generate and thus poison/disease never is (but
        ability damage from On Hit: weapons will also be not removed? but
        we could check for supernatural/extraordinary)
    * Heal (and Harm) are done in op_s_curewounds

    Remove Fear (AOE)
    All fear effects are removed from allies within the area of effect. The
    targets also gain a +4 bonus to saving throws against fear spells and
    effects for the duration of the spell.

    Freedom of Movement
    The target creature becomes immune to movement speed decrease, paralysis,
    slow, and entanglement spells and effects. These effects are also removed.

    The spell will not protect the user against self-inflicted penalties (for
    instance casting Iron Body still will apply the movement speed changes).

    Lesser Restoration
    Removes all magical, extraordinary, and supernatural effects that apply a
    penalty to ability scores, AC, attack and damage rolls, damage immunity,
    skills, spell resistance, and saving throws. Will not remove the effects of
    a curse or a disease.

    Restoration (and Restoration - Other)
    Removes all magical, extraordinary and supernatural effects that apply a
    penalty to ability scores, Armor Class, attack and damage rolls, skills,
    spell resistance, saving throws and damage immunity. This spell also removes
    all level drain, blindness, paralysis and deafness effects. Will not remove
    the effects of a curse or a disease.

    Greater Restoration
    Greater Restoration removes most temporary and all permanent negative
    effects from the target character, incuding curses, level drain and the
    spell Feeblemind. It does not remove negative effects of reduced movement
    speed.

    Neutralize Poison
    A target creature has all traces of poison (and ability score reductions)
    removed from their system.

    Remove Disease (And Paladin Remove Disease)
    All diseases and ability score decrease effects are removed from the target
    creature.

    Remove Blindness/Deafness (changed to be single target)
    The target creature is cured of blindness and deafness.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int bAOE = FALSE, nTotalToAssist = 1000000, bSupernaturalRemoval = FALSE, bApplyLink = FALSE;
    float fRadius = 0.0, fDuration = 0.0;
    effect eLink, eVis, eImpact;

    // We store what we want to remove in a Json array
    json jArray = JsonArray();

    switch (nSpellId)
    {
        case SPELL_REMOVE_FEAR:
        {
            bSupernaturalRemoval = TRUE;
            bAOE = TRUE;
            fRadius = RADIUS_SIZE_MEDIUM;
            nTotalToAssist = max(1, nCasterLevel/4);

            fDuration = GetDuration(10, MINUTES);
            bApplyLink = TRUE;
            eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, 4, SAVING_THROW_TYPE_FEAR),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            eImpact = EffectVisualEffect(VFX_FNF_LOS_HOLY_10);

            eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_FRIGHTENED));
        }
        break;
        case SPELL_FREEDOM_OF_MOVEMENT:
        {
            bSupernaturalRemoval = TRUE;

            fDuration = GetDuration(nCasterLevel, MINUTES);
            bApplyLink = TRUE;
            eLink = EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_PARALYSIS),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_ENTANGLE),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_SLOW),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_FREEDOM_OF_MOVEMENT),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))));

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_PARALYZE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ENTANGLE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SLOW));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_MOVEMENT_SPEED_DECREASE));
        }
        break;
        case SPELL_LESSER_RESTORATION:
        {
            bSupernaturalRemoval = FALSE;
            eVis = EffectVisualEffect(VFX_IMP_RESTORATION_LESSER);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ABILITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_AC_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ATTACK_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAMAGE_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SAVING_THROW_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SPELL_RESISTANCE_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SKILL_DECREASE));
        }
        break;
        case SPELL_RESTORATION:
        case SPELLABILITY_RESTOREATION_OTHER:
        {
            bSupernaturalRemoval = FALSE;
            eVis = EffectVisualEffect(VFX_IMP_RESTORATION);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ABILITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_AC_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ATTACK_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAMAGE_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SAVING_THROW_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SPELL_RESISTANCE_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SKILL_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_BLINDNESS));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DEAF));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_PARALYZE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_NEGATIVELEVEL));
        }
        break;
        case SPELL_GREATER_RESTORATION:
        {
            bSupernaturalRemoval = FALSE;
            eVis = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ABILITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_AC_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_ATTACK_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAMAGE_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SAVING_THROW_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SPELL_RESISTANCE_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SKILL_DECREASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_BLINDNESS));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DEAF));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_CURSE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DISEASE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_POISON));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_PARALYZE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_CHARMED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DOMINATED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DAZED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_CONFUSED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_FRIGHTENED));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_NEGATIVELEVEL));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_PARALYZE));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_SLOW));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_STUNNED));
        }
        break;
        case SPELL_NEUTRALIZE_POISON:
        {
            bSupernaturalRemoval = TRUE;

            eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_POISON));
        }
        break;
        case SPELL_REMOVE_DISEASE:
        case SPELLABILITY_REMOVE_DISEASE: // Paladin feat
        {
            bSupernaturalRemoval = TRUE;

            eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DISEASE));
        }
        break;
        case SPELL_REMOVE_BLINDNESS_AND_DEAFNESS:
        {
            bSupernaturalRemoval = TRUE;

            eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);

            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_BLINDNESS));
            jArray = JsonArrayInsert(jArray, JsonInt(EFFECT_TYPE_DEAF));
        }
        break;
        default:
        {
            OP_Debug("[Cure Effects] Unknown spell ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
        }
        break;
    }

    if (bAOE)
    {
        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE, SHAPE_SPHERE, fRadius, lTarget, TRUE);

        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

        SpeakString("nTotalToAssist : " + IntToString(nTotalToAssist));
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray) && nIndex < nTotalToAssist; nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SpeakString("oTarget : " + GetName(oTarget));
            SignalSpellCastAt();

            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

            if (bApplyLink == TRUE)
            {
                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
            }

            CureEffects(oTarget, jArray, bSupernaturalRemoval);
        }
    }
    else
    {
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        if (bApplyLink == TRUE)
        {
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }

        CureEffects(oTarget, jArray, bSupernaturalRemoval);
    }
}

