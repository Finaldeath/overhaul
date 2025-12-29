//:://////////////////////////////////////////////
//:: Concentration
//:: op_rs_concentrat
//:://////////////////////////////////////////////
/*
    This does concentration checks for the given spell.

    Run it with EffectRunScript tied to the effects you need to remove.

    It should run every 1 second to capture really fast actions.

    NB: Would be good if you could have a way to have an effect that basically
    does a concenration check for you similar to when casting a spell...and
    also deal with all the other concentration things (not attacking etc.).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (GetCanConcentrate(oCaster)) return;

    // Fire a VFX showing the spell has failed
    ApplyVisualEffectToObject(VFX_FNF_SPELL_FAIL_HAND, oCaster);

    // Check the spell and remove it's effects
    switch (nSpellId)
    {
        case SPELL_BLACK_BLADE_OF_DISASTER:
        {
            // Find the associated effect link, also remove all effects from our ID
            effect eCheck = GetFirstEffect(oCaster);
            object oBlade;
            while (GetIsEffectValid(eCheck))
            {
                if (GetEffectSpellId(eCheck) == nSpellId)
                {
                    if (GetEffectType(eCheck, TRUE) == EFFECT_TYPE_SUMMON_CREATURE)
                    {
                        // Get the relevant associate
                        oBlade = GetEffectObject(eCheck, 1);
                    }
                    RemoveEffect(oCaster, eCheck);
                }
                eCheck = GetNextEffect(oCaster);
            }
            // Note there are times the blade isn't valid - eg it's been unsummoned manually early.
            // Don't bother with the feedback if this is the case
            if (GetIsObjectValid(oBlade))
            {
                FloatingTextStrRefOnCreature(STRREF_CONCENTRATION_BROKEN_SUMMONED_CREATURE_DISPELLED, oCaster);
                ApplyVisualEffectAtLocation(VFX_IMP_UNSUMMON, GetLocation(oBlade));
                DestroyObject(oBlade, 0.1); // Failsafe
            }
        }
        break;
        case SPELL_HUNGRY_DARKNESS:
        {
            // Concentrate or lose the darkness AOE after 2 more rounds
            RemoveExistingAOEsByCaster(AOE_PER_DARKNESS, oCaster, RoundsToSeconds(2));

            FloatingTextStrRefOnCreature(STRREF_CONCENTRATION_LOST_HUNGRY_DARKNESS, oCaster); // *Concentration Lost - Hungry Darkness will cease after 2 more rounds*
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell Id found for concentration checks: " + IntToString(nSpellId));
        }
        break;
    }

    // Remove this effect since it's no longer needed
    RemoveEffectsFromSpell(oCaster, nSpellId, EFFECT_TYPE_RUNSCRIPT);
}

