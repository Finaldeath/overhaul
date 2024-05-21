//::///////////////////////////////////////////////
//:: Power Word, Blind
//:: op_s_pwblind.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 8
    Innate Level: 8
    School: Divination
    Descriptor(s):
    Component(s): Verbal
    Range: Short
    Area of Effect / Target: Large
    Duration: See Description
    Additional Counter Spells: Remove Blindness/Deafness
    Save: None
    Spell Resistance: Yes

    This spell blinds one or more creatures. It affects the creatures with the lowest current Hit Point totals first, selecting subjects one at a time until the next target would put it over the limit of 200.

    The duration of the spell depends on the total hit points of the affected creatures:
    Up to 50: Permanent
    51 to 100: 1d4+1 minutes
    101 to 200: 1d4+1 rounds
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Visuals and effect
    effect eVis = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    effect eBlind =  EffectBlindness();
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eBlind, eDur);

    effect eAOE = EffectVisualEffect(30002);
    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eAOE, lTarget);

    int nHPRemaining = 200;

    // Add all creatures of a given hostility to the array
    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_LOWEST_HP, SHAPE_SPHERE, RADIUS_SIZE_LARGE, lTarget, TRUE);

    // Loop array
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        json jObject = JsonArrayGet(jArray, nIndex);

        // Get the object ID
        string sOID = JsonGetString(JsonObjectGet(jObject, "objectid"));

        object oObject = StringToObject(sOID);

        if (GetIsObjectValid(oObject))
        {
            OP_Debug("[INFO] PW: Blind. Target: " + GetName(oObject) + " HP: " + IntToString(GetCurrentHitPoints(oObject)));

            // We signal this event against everyone even if it should stop early.
            SignalSpellCastAt(oObject, oCaster, TRUE);

            // We don't affect dead creatures as much as we'd like to
            if (!GetIsDead(oObject))
            {
                // Calculate the HP change to our running total
                int nCurrentHP = GetCurrentHitPoints(oObject);
                nHPRemaining -= nCurrentHP;

                // If we have at least 0 (ie if the first target had 200 HP we can still affect them)
                if (nHPRemaining >= 0)
                {
                    // Check immunity - we only test this once the target is "valid" HP wise, and still remove that HP from the pool
                    if (!GetIsImmuneWithFeedback(oObject, IMMUNITY_TYPE_BLINDNESS, oCaster))
                    {
                        // Up to 50: Permanent
                        // 51 to 100: 1d4+1 minutes
                        // 101 to 200: 1d4+1 rounds
                        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oObject);
                        if (nCurrentHP <= 50)
                        {
                            ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oObject);
                        }
                        else if (nCurrentHP <= 100)
                        {
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oObject, GetDuration(d4() + 1, MINUTES));
                        }
                        else
                        {
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oObject, GetDuration(d4() + 1, ROUNDS));
                        }
                    }
                }
            }
        }
        else
        {
            // Error!
            OP_Debug("[ERROR] Spell script: " + GetScriptName() + " has target OID is invalid in sorted array loop " + sOID, LOG_LEVEL_ERROR);
        }
    }

}

