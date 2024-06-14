//::///////////////////////////////////////////////
//:: Run Script Include
//:: op_i_runscript.nss
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

// Retrieves the item properties given field as integer (need to be set with ApplyItemPropertyTaggedInfo)
// * sField - FIELD_* to find
// Returns nDefault if not found
int GetRunScriptIntField(effect eRunScript, string sField, int nDefault = 0)
{
    if (!GetIsEffectValid(eRunScript))
    {
        OP_Debug("[GetRunScriptIntField] Error: Invalid run script effect.", LOG_LEVEL_ERROR);
        return nDefault;
    }
    string sData = GetEffectString(eRunScript, 0);

    // Any data?
    if (sData == "")
    {
        OP_Debug("[GetRunScriptIntField] Error: No data found on effect.", LOG_LEVEL_ERROR);
        return nDefault;
    }

    //OP_Debug("[GetRunScriptIntField] sData:" + sData);
    json jObject = JsonParse(sData);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        OP_Debug("[GetRunScriptIntField] No found valid Json. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return nDefault;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetRunScriptIntField] Json found but not Overhaul. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return nDefault;
    }

    // Find if the field is present
    if (JsonGetType(JsonObjectGet(jObject, sField)) != JSON_TYPE_NULL)
    {
        return JsonGetInt(JsonObjectGet(jObject, sField));
    }
    return nDefault;
}

// Retrieves the item properties given field as object (need to be set with ApplyItemPropertyTaggedInfo)
// * sField - JSON_FIELD_* to find
// Returns OBJECT_INVALID if not found
object GetRunScriptObjectField(effect eRunScript, string sField)
{
    if (!GetIsEffectValid(eRunScript))
    {
        OP_Debug("[GetRunScriptObjectField] Error: Invalid run script effect.", LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }
    string sData = GetEffectString(eRunScript, 0);

    // Any data?
    if (sData == "")
    {
        OP_Debug("[GetRunScriptObjectField] Error: No data found on effect.", LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }

    //OP_Debug("[GetRunScriptObjectField] sData:" + sData);
    json jObject = JsonParse(sData);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        OP_Debug("[GetRunScriptObjectField] No found valid Json. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetRunScriptObjectField] Json found but not Overhaul. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }

    // Find the creator OID string
    string sObject = JsonGetString(JsonObjectGet(jObject, sField));

    // Do a validity check just in case they've logged out, died etc.
    if (sObject != "")
    {
        object oCreator = StringToObject(sObject);

        if (GetIsObjectValid(oCreator))
        {
            return oCreator;
        }
    }
    return OBJECT_INVALID;
}

// Retrieves the run scripts save DC (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptSpellSaveDC(effect eRunScript)
{
    return GetRunScriptIntField(eRunScript, JSON_FIELD_SPELLSAVEDC, 0);
}

// Retrieves the run scripts metamagic (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptMetaMagic(effect eRunScript)
{
    return GetRunScriptIntField(eRunScript, JSON_FIELD_METAMAGIC, 0);
}

// Retrieves the run scripts caster class (need to be set with EffectRunScriptAutomatic)
// Returns CLASS_TYPE_INVALID if not found
int GetRunScriptCasterClass(effect eRunScript)
{
    return GetRunScriptIntField(eRunScript, JSON_FIELD_CASTERCLASS, CLASS_TYPE_INVALID);
}

// Retrieves the run scripts spell level (need to be set with EffectRunScriptAutomatic)
// Returns -1 if not found
int GetRunScriptSpellLevel(effect eRunScript)
{
    return GetRunScriptIntField(eRunScript, JSON_FIELD_SPELLLEVEL, -1);
}

// Retrieves the run scripts spontaneous casting state (need to be set with EffectRunScriptAutomatic)
// Returns 0 if not found
int GetRunScriptSpontaneous(effect eRunScript)
{
    return GetRunScriptIntField(eRunScript, JSON_FIELD_SPONTANEOUS, 0);
}

