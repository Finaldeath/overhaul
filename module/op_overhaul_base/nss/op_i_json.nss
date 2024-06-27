//::///////////////////////////////////////////////
//:: Json Include
//:: op_i_json
//:://////////////////////////////////////////////
/*
    Some helper stuff for Json used in Overhaul.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_debug"

// General check for valid JSON
const string JSON_FIELD_OVERHAUL    = "overhaul";    // Int
const int OVERHAUL_VERSION     = 1;            // Matching check for FIELD_OVERHAUL

// Fields for the Json tag storage on item properties and run script effects
const string JSON_FIELD_SPELLID     = "spellid";     // Int
const string JSON_FIELD_CREATOR     = "creator";     // String (OID)
const string JSON_FIELD_CASTERLEVEL = "casterlevel"; // Int
const string JSON_FIELD_SPELLSAVEDC = "spellsavedc"; // Int
const string JSON_FIELD_METAMAGIC   = "metamagic";   // Int
const string JSON_FIELD_CASTERCLASS = "casterclass"; // Int
const string JSON_FIELD_SPELLLEVEL  = "spelllevel";  // Int
const string JSON_FIELD_SPONTANEOUS = "spontaneous"; // Int (boolean)

// Retrieves if the given sJson string has any data, and if it has it is valid Overhaul data
// Will NOT print any debug messages on error, just reutrns FALSE.
int GetJsonMetadataIsValid(string sJson);

// Retrieves the given field as integer from the given json (need to be set with ApplyItemPropertyTaggedInfo or similar)
// * sField - FIELD_* to find
// Returns nDefault if not found
int GetJsonMetadataIntField(string sJson, string sField, int nDefault = 0);

// Retrieves the given field as object from the given json (need to be set with ApplyItemPropertyTaggedInfo)
// * sField - JSON_FIELD_* to find
// Returns OBJECT_INVALID if not found
object GetJsonMetadataObjectField(string sJson, string sField);

// Retrieves if the given sJson string has any data, and if it has it is valid Overhaul data
// Will NOT print any debug messages on error, just reutrns FALSE.
int GetJsonMetadataIsValid(string sJson)
{
    // Any data?
    if (sJson == "")
    {
        return FALSE;
    }
    json jObject = JsonParse(sJson);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        return FALSE;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        return FALSE;
    }
    return TRUE;
}

// Retrieves the given field as integer from the given json (need to be set with ApplyItemPropertyTaggedInfo or similar)
// * sField - FIELD_* to find
// Returns nDefault if not found
int GetJsonMetadataIntField(string sJson, string sField, int nDefault = 0)
{
    // Any data?
    if (sJson == "")
    {
        OP_Debug("[GetJsonMetadataIntField] Error: No data input.", LOG_LEVEL_ERROR);
        return nDefault;
    }
    json jObject = JsonParse(sJson);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        OP_Debug("[GetJsonMetadataIntField] No found valid Json. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return nDefault;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetJsonMetadataIntField] Json found but not Overhaul. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return nDefault;
    }

    // Find if the field is present
    if (JsonGetType(JsonObjectGet(jObject, sField)) != JSON_TYPE_NULL)
    {
        return JsonGetInt(JsonObjectGet(jObject, sField));
    }
    return nDefault;
}

// Retrieves the given field as object from the given Json (need to be set with ApplyItemPropertyTaggedInfo)
// * sField - JSON_FIELD_* to find
// Returns OBJECT_INVALID if not found
object GetJsonMetadataObjectField(string sJson, string sField)
{
    // Any data?
    if (sJson == "")
    {
        OP_Debug("[GetJsonMetadataObjectField] Error: No data input.", LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }
    json jObject = JsonParse(sJson);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        OP_Debug("[GetJsonMetadataObjectField] No found valid Json. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetJsonMetadataObjectField] Json found but not Overhaul. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
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

