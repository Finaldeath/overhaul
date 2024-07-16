//::///////////////////////////////////////////////
//:: Regenerate Spells
//:: op_s_regenerate.nss
//:://////////////////////////////////////////////
/*
    Now a line of regeneration spells from spell levels 1 and up.
    Separate script to the general buffs one because of the "extend duration
    if existing spell exists" occurs and is more complicated.

    Regenerate Light / Moderate / Serious / Critical / Massive Wounds
    10 rounds + 1 round/level duration
    1, 2, 3, 4, 5 per round
    Cleric level 2, 3, 5, 6, 7
    Druid level 1, 2, 4, 5, 6

    Regenerate Serious Wounds was: Monstrous Regeneration
    Regenerate Massive Wounds was: Regeneration
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Checks for regen effects of nHealing or more present on the target object
float GetRemainingDurationOfRegen(object oObject, int nHealing);

void main()
{
    if (DoSpellHook()) return;

    int nHealing, nMaxTargets = 1;
    switch (nSpellId)
    {
        case SPELL_REGENERATE_LIGHT_WOUNDS: nHealing = 1; break;
        case SPELL_REGENERATE_MODERATE_WOUNDS: nHealing = 2; break;
        case SPELL_MONSTROUS_REGENERATION: nHealing = 3; break;
        case SPELL_REGENERATE_CRITICAL_WOUNDS: nHealing = 4; break;
        case SPELL_REGENERATE: nHealing = 5; break;
        case SPELL_REGENERATE_RING:
            nHealing    = 1;
            nMaxTargets = max(1, nCasterLevel / 2);
            break;
        case SPELL_REGENERATE_CIRCLE:
            nHealing    = 3;
            nMaxTargets = max(1, nCasterLevel / 2);
            break;
        default:
        {
            Debug("[Regenerate] Unknown spell ID: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    int nVis     = VFX_IMP_HEAD_NATURE;
    effect eLink = EffectLinkEffects(EffectRegenerate(nHealing, 6.0),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        // Same AOE effect for each
        ApplyVisualEffectAtLocation(VFX_IMP_PULSE_NATURE, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray) && nIndex < nMaxTargets; nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay    = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 25.0;
            float fDuration = GetDuration(10 + nCasterLevel, ROUNDS);

            // We first check for any existing of this exact same level of regen
            fDuration += GetRemainingDurationOfRegen(oTarget, nHealing);

            // Then we cull all existing regen effects
            RemoveEffectsFromSpell(oTarget, SPELL_ANY, EFFECT_TYPE_REGENERATE);

            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        }
    }
    else
    {
        SignalSpellCastAt();

        float fDuration = GetDuration(10 + nCasterLevel, ROUNDS);

        // We first check for any existing of this exact same level of regen
        fDuration += GetRemainingDurationOfRegen(oTarget, nHealing);

        // Then we cull all existing regen effects
        RemoveEffectsFromSpell(oTarget, SPELL_ANY, EFFECT_TYPE_REGENERATE);

        ApplyVisualEffectToObject(nVis, oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    }
}

float GetRemainingDurationOfRegen(object oObject, int nHealing)
{
    effect eCheck = GetFirstEffect(oObject);
    while (GetIsEffectValid(eCheck))
    {
        if (GetEffectType(eCheck, TRUE) == EFFECT_TYPE_REGENERATE &&
            GetEffectInteger(eCheck, 0) >= nHealing)
        {
            return IntToFloat(GetEffectDurationRemaining(eCheck));
        }
        eCheck = GetNextEffect(oObject);
    }
    return 0.0;
}
