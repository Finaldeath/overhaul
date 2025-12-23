//:://////////////////////////////////////////////
//:: Detect Magic
//:: op_s_detectmagic
//:://////////////////////////////////////////////
/*
    Simplified from the 3E version. We don't consider this a hostile spell.

    You learn what magical effects are applied to creatures in the affected
    area. Supernatural and extraordinary effects are not detected.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Simple VFX (todo: new one!) to show who's had magic detected
    // Extraordinary since we don't want this visual feedback to be subject to
    // dispel magic or detect magic itself.
    // If we could do this per-player we would.
    effect eDur = ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_AURA_PULSE_CYAN_WHITE));

    json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        json jSpells = JsonArray();

        // Loop thier effects to get the unique spell Ids
        effect eCheck = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eCheck))
        {
            // *technically* some effects like AOE on enter effects might not
            // work with this check, but those should be obvious from them
            // standing in an AOE!
            if (GetEffectSubType(eCheck) == SUBTYPE_MAGICAL &&
                GetEffectSpellId(eCheck) != SPELL_INVALID)
            {
                json jObject = JsonObject();

                string sSpell = GetSpellName(GetEffectSpellId(eCheck));

                jObject = JsonObjectSet(jObject, FIELD_METRIC, JsonString(sSpell));
                jSpells = JsonArrayInsert(jSpells, jObject);
            }
            eCheck = GetNextEffect(oTarget);
        }
        // Unique the array
        jSpells = JsonArrayTransform(jSpells, JSON_ARRAY_UNIQUE);

        // Sort the array
        jSpells = JsonArrayTransform(jSpells, JSON_ARRAY_SORT_ASCENDING);

        string sOutput;

        // Print it out
        int nSpellsIndex;
        for (nSpellsIndex = 0; nSpellsIndex < JsonGetLength(jSpells); nSpellsIndex++)
        {
            json jObject = JsonArrayGet(jSpells, nSpellsIndex);

            string sString = JsonGetString(JsonObjectGet(jObject, FIELD_METRIC));

            if (nSpellsIndex == 0)
            {
                sOutput = sString;
            }
            else
            {
                sOutput += ", " + sString;
            }
        }

        // Send output if valid
        if (sOutput != "")
        {
            SendMessageToPC(oCaster, "Detected magic on " + GetName(oTarget) + ": " + sOutput + ".");
            // TODO: New VFX
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eDur, oTarget, 3.0));
        }
    }
}

