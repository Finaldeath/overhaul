//::///////////////////////////////////////////////
//:: Run Script: Clean Item Properties
//:: op_rs_cleanprops.ns
//:://////////////////////////////////////////////
/*
    The removal script tied to the item properties being applied. If this
    is removed the item properties on all items with the same spell ID are
    removed.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (nSpellId == -1 ||
        GetLastRunScriptEffectScriptType() != RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED)
    {
        OP_Debug("[Run Script: Clean Item Properties] No spell Id or script not firing in On Removed slot.", LOG_LEVEL_ERROR);
        return;
    }

    // Loop the given tagged objects stored in our effect tag
    string sTag = GetEffectTag(GetLastRunScriptEffect());

    if (sTag == "")
    {
        OP_Debug("[Run Script: Clean Item Properties] No item data stored.", LOG_LEVEL_ERROR);
        return;
    }

    json jArray = JsonParse(sTag);

    // Loop the items
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        json jObject = JsonArrayGet(jArray, nIndex);

        // Get the object ID
        string sOID = JsonGetString(JsonObjectGet(jObject, "objectid"));

        object oItem = StringToObject(sOID);

        if (GetIsObjectValid(oItem) && GetObjectType(oItem) == OBJECT_TYPE_ITEM)
        {
            // Remove item properties
            RemoveItemPropertiesMatchingSpellId(oItem, nSpellId);
        }
        else
        {
            // Error - object has been lost since spell was cast
        }
    }
}

