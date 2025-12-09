//:://////////////////////////////////////////////
//:: Overhaul Include: Run Script
//:: op_i_runscript
//:://////////////////////////////////////////////
/*
    Some helper functions for EffectRunScript.

    We can store information so can run the run script effects as if they were
    real spell scripts by retrieving that information back (except the
    applied script which we just avoid using entirely).

    Spell Id, Caster Level, Caster are all stored on the run script directly.

    This is similar to item properties see op_i_itemprops
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_debug"
#include "op_i_json"

// Retrieves the run scripts save DC (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptSpellSaveDC(effect eRunScript);

// Retrieves the run scripts metamagic (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptMetaMagic(effect eRunScript);

// Retrieves the run scripts caster class (need to be set with EffectRunScriptAutomatic)
// Returns CLASS_TYPE_INVALID if not found
int GetRunScriptCasterClass(effect eRunScript);

// Retrieves the run scripts spell level (need to be set with EffectRunScriptAutomatic)
// Returns -1 if not found
int GetRunScriptSpellLevel(effect eRunScript);

// Retrieves the run scripts spontaneous casting state (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptSpontaneous(effect eRunScript);

// Retrieves the run scripts illusionary state (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptIllusionary(effect eRunScript);

// Retrieves the run scripts illusionary strength (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptIllusionaryStrength(effect eRunScript);

// Retrieves the run scripts save DC (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptSpellSaveDC(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptSpellSaveDC] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_SPELLSAVEDC, 0);
}

// Retrieves the run scripts metamagic (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptMetaMagic(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptMetaMagic] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_METAMAGIC, 0);
}

// Retrieves the run scripts caster class (need to be set with EffectRunScriptAutomatic)
// Returns CLASS_TYPE_INVALID if not found
int GetRunScriptCasterClass(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptCasterClass] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_CASTERCLASS, CLASS_TYPE_INVALID);
}

// Retrieves the run scripts spell level (need to be set with EffectRunScriptAutomatic)
// Returns -1 if not found
int GetRunScriptSpellLevel(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptSpellLevel] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_SPELLLEVEL, -1);
}

// Retrieves the run scripts spontaneous casting state (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptSpontaneous(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptSpontaneous] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_SPONTANEOUS, 0);
}

// Retrieves the run scripts illusionary state (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptIllusionary(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptIllusionary] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_ILLUSIONARY, 0);
}

// Retrieves the run scripts illusionary strength (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptIllusionaryStrength(effect eRunScript)
{
    if (DEBUG_LEVEL >= ERROR) if (GetEffectType(eRunScript) != EFFECT_TYPE_RUNSCRIPT) Error("[GetRunScriptIllusionaryStrength] eRunScript isn't Run Script type");
    return GetJsonMetadataIntField(GetEffectString(eRunScript, 0), JSON_FIELD_ILLUSIONARYSTRENGTH, 0);
}
