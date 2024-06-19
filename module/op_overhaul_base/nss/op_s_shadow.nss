//::///////////////////////////////////////////////
//:: Shadow spells
//:: op_s_shadow.nss
//:://////////////////////////////////////////////
/*
    This covers the conjuration:

    Shadow Conjuration
    Greater Shadow Conjuration
    Shades

    And for evocation spells:

    Shadow Evocation
    Greater Shadow Evocation

    A NUI panel should be able to adjust what spell is in each slot.

    We then execute the real spell script but with the illusion and
    spell ID override settings enabled.

    The spell script then does the illusionary logic (Will save, 20/60/80%
    effective if saved, etc).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // If already illusionary we exit.
    if (bIllusionary)
    {
        OP_Debug("[op_s_shadow] Recursive illusion call to this script?", LOG_LEVEL_ERROR);
        return;
    }

    // Get the illusion strength and default spell Id
    int nStrength, nNewSpellId;
    switch (nSpellId)
    {
        case 1:
        {
            nStrength = 20;
            nNewSpellId = SPELL_MELFS_ACID_ARROW;
        }
        break;
        default:
        {
            // No valid spell Id
            OP_Debug("[op_s_shadow] No valid Spell Id", LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    // Get the script and run it
    string sScript = Get2DAString("spells", "script", nNewSpellId);

    // Validate
    if (ResManGetAliasFor(sScript, RESTYPE_NSS) == "")
    {
        OP_Debug("[op_s_shadow] Script not found: " + sScript, LOG_LEVEL_ERROR);
        return;
    }

    // Caster feedback
    SendMessageToPC(oCaster, "Illusion spell being applied: " + GetSpellName(nNewSpellId));

    SetScriptParam(SCRIPT_PARAMETER_SPELL_ID, IntToString(nNewSpellId));
    SetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY, "1");
    SetScriptParam(SCRIPT_PARAMETER_ILLUSIONARY_STRENGTH, IntToString(nStrength));
    ExecuteScript(sScript, OBJECT_SELF);

    // Done, no real cleanup needed (hopefully)
}

