//::///////////////////////////////////////////////
//:: Cone of Dimness - Run Script
//:: op_s_coneofdimrs
//:://////////////////////////////////////////////
/*
    See op_s_coneofdim
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

const string TAG_CONE_OF_DIMNESS = "CONE_OF_DIMNESS";

void main()
{
    effect eRunScript = GetLastRunScriptEffect();
    int nEventType = GetLastRunScriptEffectScriptType();

    // We apply blindness/miss chance using the remaining duration "just in case" so it cleans up
    // even if the Run Script fails to. We add 1 second so it's just after the end of EffectRunScript
    float fDurationRemaining = IntToFloat(GetEffectDurationRemaining(eRunScript)) + 1.0;

    //SpeakString("Event! " + IntToString(nEventType));

    if (nEventType == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_APPLIED)
    {
        // The applied script doesn't have a valid effect to hook for the remaining duration so
        // the blindness is done in the spell script instead.
    }
    else if (nEventType == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        // If immune check
        if (GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_BLINDNESS, oCaster))
        {
            RemoveEffect(oTarget, eRunScript);
            RemoveEffectsFromSpell(oTarget, SPELL_CONE_OF_DIMNESS, EFFECT_TYPE_ALL, TAG_CONE_OF_DIMNESS);
            return;
        }

        // If concealed we just leave it no more saves
        if (GetHasEffect(oTarget, EFFECT_TYPE_MISS_CHANCE, TAG_CONE_OF_DIMNESS))
        {
            return;
        }

        // Saving throw check
        if (DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
        {
            // Remove all related tagged effects
            RemoveEffectsFromSpell(oTarget, SPELL_CONE_OF_DIMNESS, EFFECT_TYPE_BLINDNESS, TAG_CONE_OF_DIMNESS);

            // Miss Chance applied for the rest of the duration
            effect eLink = EffectLinkEffects(EffectMissChance(20), EffectIcon(EFFECT_ICON_MISS_CHANCE));
            eLink = TagEffect(UnyieldingEffect(eLink), TAG_CONE_OF_DIMNESS);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDurationRemaining);
            return;
        }

        // Apply blindness if not already applied
        if (!GetHasEffect(oTarget, EFFECT_TYPE_BLINDNESS, TAG_CONE_OF_DIMNESS))
        {
            effect eBlindness = TagEffect(UnyieldingEffect(EffectBlindness()), TAG_CONE_OF_DIMNESS);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlindness, oTarget, fDurationRemaining);
        }
    }
    else if (nEventType == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED)
    {
        // Remove all related tagged effects
        RemoveEffectsFromSpell(oTarget, SPELL_CONE_OF_DIMNESS, EFFECT_TYPE_ALL, TAG_CONE_OF_DIMNESS);
    }
}

