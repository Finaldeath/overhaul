//::///////////////////////////////////////////////
//:: Silence and Amplify
//:: op_s_silence
//:://////////////////////////////////////////////
/*
    Silence

    Creates a zone of silence around the target creature, preventing all within
    the area of effect from casting spells or using abilities with verbal
    components. Additionally those in the area gain a 100% increase in immunity
    to sonic damage. If cast on an ally, no saving throws or spell resistance
    checks are necessary.

    When entering the area of silence the creature gets a will save and spell
    resistance check to ignore it.

    If a creature under the effect of Amplify enters the area of Silence it they
    will nullify each other, supressing both spells.

    If cast on a creature eminating a area of Amplification it will dispel it.

    Amplify

    You cause an amplification of all sounds within the spell's area. This
    decreases creatuers Move Silently skill by 20 and decreases Sonic immunity.
    Those creatures within the spell's area do not notice the increased
    amplification. If cast on an ally, no saving throws or spell resistance
    checks are necessary.

    When entering the area of amplification the creature gets a will save and
    spell resistance check to ignore it.

    If a creature under the effect of Silence enters the area of Amplify it they
    will nullify each other, supressing both spells.

    If cast on a creature eminating a area of Silence it will dispel it.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// This spell gets messy due to interaction with amplify. We will action
// it as a kind of "Slow/Haste" situation where the number of
// "Amplify/Silence" then is accounted for and if it's towards one or the
// other
void CheckAndApplySilenceOrAmplify()
{
    // Check count of each
    int nSilence = 0;
    effect eCheck = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectType(eCheck, TRUE) == EFFECT_TYPE_RUNSCRIPT)
        {
            switch (GetEffectSpellId(eCheck))
            {
                case SPELL_AMPLIFY:
                {
                    nSilence--;
                }
                break;
                case SPELL_SILENCE:
                {
                    nSilence++;
                }
                break;
            }
        }
        eCheck = GetNextEffect(oTarget);
    }

    if (nSilence > 0)
    {
        SendMessageToPC(oCaster, "Silence being applied to: " + GetName(oTarget));
        // Remove all other instances of amplify
        RemoveEffectsFromSpell(oTarget, SPELL_AMPLIFY, EFFECT_TYPE_SKILL_DECREASE, TAG_AOEEFFECT);

        // Apply silence
        if (!GetHasEffect(oTarget, EFFECT_TYPE_SILENCE, SPELL_SILENCE, TAG_AOEEFFECT))
        {
            effect eLink = EffectLinkEffects(EffectSilence(),
                           EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_SONIC, 100),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL)));

            ApplyVisualEffectToObject(VFX_IMP_SILENCE, oTarget);

            SendMessageToPC(oCaster, "Silence applied to: " + GetName(oTarget));
            // Apply as per AOE Tagged effects
            eLink = ExtraordinaryEffect(eLink);
            eLink = TagEffect(eLink, TAG_AOEEFFECT);
            // We apply things "for a long time" since no AOE should be permanent. This helps with state scripts like Paralysis
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 10000.0);
        }
    }
    else if (nSilence < 0)
    {
        SendMessageToPC(oCaster, "Amplifcation being applied to: " + GetName(oTarget));
        // Remove all other instances of silence
        RemoveEffectsFromSpell(oTarget, SPELL_SILENCE, EFFECT_TYPE_SILENCE, TAG_AOEEFFECT);

        // Apply amplify
        if (!GetHasEffect(oTarget, EFFECT_TYPE_SKILL_DECREASE, SPELL_AMPLIFY, TAG_AOEEFFECT))
        {
            effect eLink = EffectLinkEffects(EffectSkillDecrease(SKILL_MOVE_SILENTLY, 20),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL));

            ApplyVisualEffectToObject(VFX_IMP_REDUCE_ABILITY_SCORE, oTarget);

            SendMessageToPC(oCaster, "Amplifcation applied to: " + GetName(oTarget));
            // Apply as per AOE Tagged effects
            eLink = ExtraordinaryEffect(eLink);
            eLink = TagEffect(eLink, TAG_AOEEFFECT);
            // We apply things "for a long time" since no AOE should be permanent. This helps with state scripts like Paralysis
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 10000.0);
        }
    }
    else
    {
        // Remove both
        SendMessageToPC(oCaster, "Removing all from: " + GetName(oTarget));
        RemoveEffectsFromSpell(oTarget, SPELL_SILENCE, EFFECT_TYPE_SILENCE, TAG_AOEEFFECT);
        RemoveEffectsFromSpell(oTarget, SPELL_AMPLIFY, EFFECT_TYPE_SKILL_DECREASE, TAG_AOEEFFECT);
    }
}

void main()
{

    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, (GetIsFriend(oTarget, oCaster) == FALSE));

            // Always a save regardless of status to caster
            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
                {
                    SendMessageToPC(oTarget, "Applying persistent AOE visual");
                    ApplyAOEPersistentEffect(oTarget, EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL));

                    // If we are now more "silenced" then "amplified" we apply as such.
                    CheckAndApplySilenceOrAmplify();
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);

        // If we are now more "silenced" then "amplified" we apply as such.
        CheckAndApplySilenceOrAmplify();
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        int nOppositeSpell, nAOE;

        switch (nSpellId)
        {
            case SPELL_SILENCE:
            {
                nOppositeSpell = SPELL_AMPLIFY;
                nAOE = AOE_MOB_SILENCE;
            }
            break;
            case SPELL_AMPLIFY:
            {
                nOppositeSpell = SPELL_SILENCE;
                nAOE = AOE_PER_AMPLIFY;
            }
            break;
            default:
            {
                Debug("[op_s_silenceampl] No valid spell ID passed in: " + IntToString(nSpellId));
                return;
            }
            break;
        }

        // Dispel if they have the other spell AOE already
        if (GetHasEffect(oTarget, EFFECT_TYPE_AREA_OF_EFFECT, nOppositeSpell))
        {
            json jSpellId = JsonArray();
            jSpellId = JsonArrayInsert(jSpellId, JsonInt(nOppositeSpell));
            SendDispelMagicFeedback(oCaster, oTarget, jSpellId);
            RemoveEffectsFromSpell(oTarget, nOppositeSpell, EFFECT_TYPE_AREA_OF_EFFECT);
            return;
        }

        effect eLink = EffectLinkEffects(EffectAreaOfEffect(nAOE, GetScriptName(), GetScriptName(), GetScriptName()),
                       EffectLinkEffects(EffectIcon(EFFECT_ICON_AREA_OF_EFFECT),
                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

        // No save if allied
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_ALLALLIES))
        {
            SignalSpellCastAt(oTarget, oCaster, FALSE);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
        }
        else if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
                {
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
                }
            }
        }
    }
}

