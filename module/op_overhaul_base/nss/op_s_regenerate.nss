//:://////////////////////////////////////////////
//:: Regenerate Spells
//:: op_s_regenerate
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

    Warlock Fiendish Healing added as a regeneration spell, to mirror the
    QoL stuff.
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
    int nImpact = VFX_NONE;
    int nVis = VFX_IMP_HEAD_NATURE;
    int nDuration = 10 + nCasterLevel;

    switch (nSpellId)
    {
        case SPELL_REGENERATE_LIGHT_WOUNDS: nHealing = 1; break;
        case SPELL_REGENERATE_MODERATE_WOUNDS: nHealing = 2; break;
        case SPELL_MONSTROUS_REGENERATION: nHealing = 3; break;
        case SPELL_REGENERATE_CRITICAL_WOUNDS: nHealing = 4; break;
        case SPELL_REGENERATE: nHealing = 5; break;
        case SPELL_REGENERATE_RING:
        {
            nHealing    = 1;
            nMaxTargets = max(1, nCasterLevel / 2);
            nImpact = VFX_IMP_PULSE_NATURE;
        }
        break;
        case SPELL_REGENERATE_CIRCLE:
        {
            nHealing    = 3;
            nMaxTargets = max(1, nCasterLevel / 2);
            nImpact = VFX_IMP_PULSE_NATURE;
        }
        break;
        case SPELL_FIENDISH_RESILIENCE:
        {
            // Warlock ability. 1 HP by default, increased to 2 at 13 and 5 at 18.
            if (GetLevelByClass(CLASS_TYPE_WARLOCK, oCaster) >= 18)
            {
                nHealing = 5;
            }
            else if (GetLevelByClass(CLASS_TYPE_WARLOCK, oCaster) >= 13)
            {
                nHealing = 2;
            }
            else
            {
                nHealing = 1;
            }
            nDuration = 20; // Always 2 minutes, so 20 rounds
            nVis = VFX_IMP_HEAD_NATURE; // TODO new VFX
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    effect eLink = EffectLinkEffects(EffectRegenerate(nHealing, 6.0),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

    // Same AOE effect for each
    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray) && nIndex < nMaxTargets; nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay    = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 25.0;
        float fDuration = GetDuration(nDuration, ROUNDS);

        // We first check for any existing of this exact same level of regen
        fDuration += GetRemainingDurationOfRegen(oTarget, nHealing);

        // Then we cull all existing regen effects
        RemoveEffectsFromSpell(oTarget, SPELL_ANY, EFFECT_TYPE_REGENERATE);

        DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
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
