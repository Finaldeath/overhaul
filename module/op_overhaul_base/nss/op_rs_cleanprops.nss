//:://////////////////////////////////////////////
//:: Run Script: Clean Item Properties
//:: op_rs_cleanprops
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
    // If this run script isn't the right one to run, we exit
    if (!GetItemTrackingIDMatches(GetLastRunScriptEffect()))
    {
        if (DEBUG_LEVEL >= INFO) Info("[Run Script: Clean Item Properties] No longer current removal script, exiting.");
        return;
    }

    if (nSpellId == -1 ||
        GetLastRunScriptEffectScriptType() != RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_REMOVED)
    {
        if (DEBUG_LEVEL >= ERROR) Error("[Run Script: Clean Item Properties] No spell Id or script not firing in On Removed slot.");
        return;
    }

    // Loop the given tagged objects stored in our run script tag
    string sTag = GetEffectString(GetLastRunScriptEffect(), 0);

    if (sTag == "")
    {
        if (DEBUG_LEVEL >= ERROR) Error("[Run Script: Clean Item Properties] No item data stored.");
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
            // Info debug - object has been lost since spell was cast (logged out or destroyed)
            if (DEBUG_LEVEL >= INFO) Info("[Run Script: Clean Item Properties] OID not found in module or not an item: " + sOID);
        }
    }
}
