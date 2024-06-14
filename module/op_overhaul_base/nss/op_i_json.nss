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

