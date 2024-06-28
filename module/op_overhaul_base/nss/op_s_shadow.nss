//::///////////////////////////////////////////////
//:: Shadow spells
//:: op_s_shadow.nss
//:://////////////////////////////////////////////
/*
    This covers the conjuration:

    Shadow Conjuration         - 20% effective, max level 3
    Greater Shadow Conjuration - 60% effective, max level 6
    Shades                     - 80% effective, max level 8

    And for evocation spells:

    Shadow Evocation         - 20% effective, max level 4
    Greater Shadow Evocation - 60% effective, max level 7

    A NUI panel should be able to adjust what spell is in each slot.

    We then execute the real spell script but with the illusion and
    spell ID override settings enabled.

    The spell script then does the illusionary logic (Will save, 20/60/80%
    effective if saved, etc).

    For now we just reassign the current spells as-is with the 5 subspells.
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
        // Shadow Conjuration; 20% effective, max level 3
        case SPELL_SHADOW_CONJURATION_DARKNESS:      nStrength = 20; nNewSpellId = SPELL_DARKNESS; break;
        case SPELL_SHADOW_CONJURATION_INIVSIBILITY:  nStrength = 20; nNewSpellId = SPELL_INVISIBILITY; break;
        case SPELL_SHADOW_CONJURATION_MAGE_ARMOR:    nStrength = 20; nNewSpellId = SPELL_MAGE_ARMOR; break;
        case SPELL_SHADOW_CONJURATION_MAGIC_MISSILE: nStrength = 20; nNewSpellId = SPELL_MAGIC_MISSILE; break;
        case SPELL_SHADOW_CONJURATION_SUMMON_SHADOW: nStrength = 20; nNewSpellId = SPELL_SUMMON_CREATURE_III; break;

        // Greater Shadow Conjuration; 60% effective, max level 6
        case SPELL_GREATER_SHADOW_CONJURATION_ACID_ARROW:    nStrength = 60; nNewSpellId = SPELL_MELFS_ACID_ARROW; break;
        case SPELL_GREATER_SHADOW_CONJURATION_MINOR_GLOBE:   nStrength = 60; nNewSpellId = SPELL_MINOR_GLOBE_OF_INVULNERABILITY; break;
        case SPELL_GREATER_SHADOW_CONJURATION_MIRROR_IMAGE:  nStrength = 60; nNewSpellId = SPELL_GHOSTLY_VISAGE; break; // Pour one out for Mirror Image
        case SPELL_GREATER_SHADOW_CONJURATION_WEB:           nStrength = 60; nNewSpellId = SPELL_WEB; break;
        case SPELL_GREATER_SHADOW_CONJURATION_SUMMON_SHADOW: nStrength = 60; nNewSpellId = SPELL_SUMMON_CREATURE_VI; break;

        // Shades; 80% effective, max level 8
        case SPELL_SHADES_CONE_OF_COLD:  nStrength = 80; nNewSpellId = SPELL_CONE_OF_COLD; break;
        case SPELL_SHADES_FIREBALL:      nStrength = 80; nNewSpellId = SPELL_FIREBALL; break;
        case SPELL_SHADES_STONESKIN:     nStrength = 80; nNewSpellId = SPELL_STONESKIN; break;
        case SPELL_SHADES_WALL_OF_FIRE:  nStrength = 80; nNewSpellId = SPELL_WALL_OF_FIRE; break;
        case SPELL_SHADES_SUMMON_SHADOW: nStrength = 80; nNewSpellId = SPELL_SUMMON_CREATURE_VIII; break;

        // The base spells should never be cast directly!
        case SPELL_SHADOW_CONJURATION:
        case SPELL_GREATER_SHADOW_CONJURATION:
        case SPELL_SHADES:
        {
            OP_Debug("[Shadow Spells] Directly casting parent spell. ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
            return;
        }
        break;
        default:
        {
            OP_Debug("[Shadow Spells] Unknown spell ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    // Get the script and run it
    string sScript = Get2DAString("spells", "ImpactScript", nNewSpellId);

    // Validate
    if (ResManGetAliasFor(sScript, RESTYPE_NSS) == "")
    {
        OP_Debug("[op_s_shadow] Spell script for target spell not found: " + sScript, LOG_LEVEL_ERROR);
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

