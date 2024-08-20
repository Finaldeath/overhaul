//::///////////////////////////////////////////////
//:: Cone of Dimness
//:: op_s_coneofdim
//:://////////////////////////////////////////////
/*
    Creatures in the cone must succeed on a Will save or believe darkness has
    engulfed them, rendering them blinded. A creature that makes its initial
    Will save suffers no ill effects. A creature that fails its initial save
    can attempt a new saving throw each round until it succeeds or the spell
    expires. Failing the subsequent saving throws results in continued
    blindness. Success on a later save means the creature feels its vision
    beginning to clear, although its vision remains dim and hazy for the
    remainder of the spell. This results in a 20% miss chance for any attack
    the creature makes.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////
// op_s_coneofdimrs - Run Script for spell

#include "op_i_spells"

const string TAG_CONE_OF_DIMNESS = "CONE_OF_DIMNESS";

void main()
{
    int nEventType = GetLastRunScriptEffectScriptType();
    if (nEventType == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        effect eRunScript = GetLastRunScriptEffect();
        // We apply blindness/miss chance using the remaining duration "just in case" so it cleans up
        // even if the Run Script fails to. We add 1 second so it's just after the end of EffectRunScript
        float fDurationRemaining = IntToFloat(GetEffectDurationRemaining(eRunScript)) + 1.0;

        // If immune check
        if (GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_BLINDNESS))
        {
            RemoveEffect(oTarget, eRunScript);
            RemoveEffectsFromSpell(oTarget, SPELL_CONE_OF_DIMNESS, EFFECT_TYPE_ALL, TAG_CONE_OF_DIMNESS);
            return;
        }

        // If concealed we just leave it no more saves
        if (GetHasEffect(oTarget, EFFECT_TYPE_MISS_CHANCE, nSpellId, TAG_CONE_OF_DIMNESS))
        {
            return;
        }

        // Saving throw check - if we fail apply the further effects
        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
        {
            // Remove all related tagged effects
            RemoveEffectsFromSpell(oTarget, SPELL_CONE_OF_DIMNESS, EFFECT_TYPE_BLINDNESS, TAG_CONE_OF_DIMNESS);

            // Miss Chance applied for the rest of the duration
            effect eLink = EffectLinkEffects(EffectMissChance(GetStaticValue(20)), EffectIcon(EFFECT_ICON_MISS_CHANCE));
            eLink        = TagEffect(UnyieldingEffect(eLink), TAG_CONE_OF_DIMNESS);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDurationRemaining);
            return;
        }

        // Apply blindness if not already applied
        if (!GetHasEffect(oTarget, EFFECT_TYPE_BLINDNESS, nSpellId, TAG_CONE_OF_DIMNESS))
        {
            effect eBlindness = TagEffect(UnyieldingEffect(EffectBlindness()), TAG_CONE_OF_DIMNESS);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlindness, oTarget, fDurationRemaining);
        }
        return;
    }
    else if (nEventType == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED)
    {
        // Remove all related tagged effects
        RemoveEffectsFromSpell(oTarget, SPELL_CONE_OF_DIMNESS, EFFECT_TYPE_ALL, TAG_CONE_OF_DIMNESS);
        return;
    }

    // Main script
    if (DoSpellHook()) return;

    effect eRunScript = EffectRunScriptEnhanced();
    effect eBlindness = TagEffect(UnyieldingEffect(EffectBlindness()), TAG_CONE_OF_DIMNESS);
    float fDuration   = GetDuration(nCasterLevel, ROUNDS);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        // Get the distance between the target and caster to delay the application of effects
        float fDelay = GetDistanceBetween(oCaster, oTarget) / 20.0;

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            if (GetAffectedByIllusion(oTarget) &&
               !GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_BLINDNESS))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                {

                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_BLIND_DEAF_M, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eRunScript, oTarget, fDuration));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlindness, oTarget, fDuration));
                }
            }
        }
    }
}
