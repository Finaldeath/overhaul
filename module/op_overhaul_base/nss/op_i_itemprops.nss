//::///////////////////////////////////////////////
//:: Item Properties Include
//:: op_i_itemprops.nss
//:://////////////////////////////////////////////
/*
    Item property include.

    We are not going to be hooking into the fact item properties are technically
    effects with spell Ids etc.

    Instead we will add metadata on the item property creation into the tag
    using Json which we can then use to sort it later.


*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_constants"
#include "op_i_feedback"
#include "op_i_debug"
#include "op_i_json"
#include "utl_i_itemprop"

// Debugs the given item and it's properties
void DebugItemProperties(object oItem);

// Dispels magical item properties on oItem
// Note: This will attempt to just dispel all present item properties since this should
// only be called when it's targeted on a single creature or an item on the ground/in inventory
// - bCreatureItem - If set oItem is ignored (although the possessor is used) and it gets one of
//   the creature items to remove things from, and applies it to the other 2.
int DispelMagicalItemProperties(object oItem, object oCaster, int nCasterLevel, int bCreatureItem = FALSE);

// Returns TRUE if there are any item properties matching the given property
int GetItemHasMatchingItemProperty(object oItem, itemproperty ipProperty);

// Returns a string with the duration of the property information
string GetItemPropertyDurationString(itemproperty ipProperty);

// Removes item properties with the matching tag
void RemoveItemPropertiesMatchingTag(object oItem, string sTag);

// Removes item properties matching the given spell Id (need to be set with ApplyItemPropertyTaggedInfo)
void RemoveItemPropertiesMatchingSpellId(object oItem, int nSpellId);

// Returns a the item property tagged with Json relating to the given fields
itemproperty ApplyItemPropertyTaggedInfo(itemproperty ipProperty, int nSpellId, object oCreator, int nCasterLevel, int nSpellSaveDC, int nMetaMagic);

// Retrieves the item properties spell Id (need to be set with ApplyItemPropertyTaggedInfo)
// Returns SPELL_INVALID if not found
int GetItemPropertySpellId(itemproperty ipProperty);

// Retrieves the item properties creator (need to be set with ApplyItemPropertyTaggedInfo)
// Returns OBJECT_INVALID if not found
object GetItemPropertyCreator(itemproperty ipProperty);

// Retrieves the item properties caster level (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertyCasterLevel(itemproperty ipProperty);

// Retrieves the item properties spell save DC (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertySpellSaveDC(itemproperty ipProperty);

// Retrieves the item properties metamagic (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertyMetaMagic(itemproperty ipProperty);

// Debugs the given item and it's properties
void DebugItemProperties(object oItem)
{
    OP_Debug("Debugging item properties of: " + GetName(oItem));
    itemproperty ipCheck = GetFirstItemProperty(oItem);
    int nCount = 1;
    while (GetIsItemPropertyValid(ipCheck))
    {
        string sDebug = "  Item Property [" + IntToString(nCount) +
                        "] Name: [" + ItemPropertyToString(ipCheck) +
                        "] Tag: [" + GetItemPropertyTag(ipCheck) +
                        "] Uses remaining: [" + IntToString(GetItemPropertyUsesPerDayRemaining(oItem, ipCheck)) +
                        "] Duration: [" + GetItemPropertyDurationString(ipCheck) +
                        // Stuff that may not be set for now debug default values
                        "] Spell Id: [" + IntToString(GetItemPropertySpellId(ipCheck)) +
                        "] Creator: [" + GetName(GetItemPropertyCreator(ipCheck)) +
                        "] Caster Level: [" + IntToString(GetItemPropertyCasterLevel(ipCheck)) +
                        "] Spell Save DC: [" + IntToString(GetItemPropertySpellSaveDC(ipCheck)) +
                        "]";

        OP_Debug(sDebug);
        nCount++;
        ipCheck = GetNextItemProperty(oItem);
    }
}

// Dispels magical item properties on oItem
// Note: This will attempt to just dispel all present item properties since this should
// only be called when it's targeted on a single creature or an item on the ground/in inventory
// - bCreatureItem - If set oItem is ignored (although the possessor is used) and it gets one of
//   the creature items to remove things from, and applies it to the other 2.
int DispelMagicalItemProperties(object oItem, object oCaster, int nCasterLevel, int bCreatureItem = FALSE)
{
    // Count amount
    int nAmount = 0;

    json jIgnoreArray = JsonArray();
    json jDispelArray = JsonArray();

    object oSecondItem, oThirdItem;

    if (bCreatureItem)
    {
        // Find first valid item
        object oPossessor = GetItemPossessor(oItem);
        int nSlot = INVENTORY_SLOT_CWEAPON_L;
        oItem = GetItemInSlot(nSlot, oPossessor);

        if (!GetIsObjectValid(oItem))
        {
            oItem = GetItemInSlot(++nSlot, oPossessor);
            if (!GetIsObjectValid(oItem))
            {
                oItem = GetItemInSlot(++nSlot, oPossessor);

                if (!GetIsObjectValid(oItem))
                {
                    OP_Debug("[DispelMagicalItemProperties] No valid creature weapons but want to dispel them? oPossessor: " + GetName(oPossessor));
                    return 0;
                }
            }
        }
        if (nSlot == INVENTORY_SLOT_CWEAPON_L)
        {
            oSecondItem = GetItemInSlot(++nSlot, oPossessor);
            oThirdItem = GetItemInSlot(++nSlot, oPossessor);
        }
        else if (nSlot == INVENTORY_SLOT_CWEAPON_R)
        {
            oSecondItem = GetItemInSlot(++nSlot, oPossessor);
        }
    }

    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        // Check if it's magical, ie from a spell (ie not assassins poison or some other nonmagical effect)
        int nSpellId = GetItemPropertySpellId(ipCheck);
        if (nSpellId != SPELL_INVALID && !GetArrayMatchesInt(jIgnoreArray, nSpellId))
        {
            // Do a dispel magic check
            if (d20() + nCasterLevel >= 11 + GetItemPropertyCasterLevel(ipCheck))
            {
                // Remove it the spell Id ones from the right items
                if (bCreatureItem)
                {
                    RemoveItemPropertiesMatchingSpellId(oItem, nSpellId);
                    RemoveItemPropertiesMatchingSpellId(oSecondItem, nSpellId);
                    RemoveItemPropertiesMatchingSpellId(oThirdItem, nSpellId);
                }
                else
                {
                    RemoveItemPropertiesMatchingSpellId(oItem, nSpellId);
                }
                // Add to feedback array
                jDispelArray = JsonArrayInsert(jDispelArray, JsonInt(nSpellId));

                nAmount++;
            }
            // Add to ignore array since we've checked it - no double checks (or
            // we dispelled it so the next ones are timed to be cleared anyway).
            jIgnoreArray = JsonArrayInsert(jIgnoreArray, JsonInt(nSpellId));
        }
        ipCheck = GetNextItemProperty(oItem);
    }
    if (nAmount > 0)
    {
        SendDispelMagicFeedbackForItem(oCaster, oItem, jDispelArray);
    }
    return nAmount;
}

// Returns a string with the duration of the property information
string GetItemPropertyDurationString(itemproperty ipProperty)
{
    string sReturn;
    switch(GetItemPropertyDurationType(ipProperty))
    {
        case DURATION_TYPE_TEMPORARY: sReturn = "Temporary (Duration total: " + IntToString(GetItemPropertyDuration(ipProperty)) + ", Duration remaining: " + IntToString(GetItemPropertyDurationRemaining(ipProperty)) + ")"; break;
        case DURATION_TYPE_PERMANENT: sReturn = "Permanent"; break;
        default:
        {
            sReturn = "Duration type not identified: [" + IntToString(GetItemPropertyDurationType(ipProperty)) + "]";
        }
        break;
    }
    return sReturn;
}

// Removes item properties with the matching tag
void RemoveItemPropertiesMatchingTag(object oItem, string sTag)
{
    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        if (GetItemPropertyTag(ipCheck) == sTag)
        {
            RemoveItemProperty(oItem, ipCheck);
        }
        ipCheck = GetNextItemProperty(oItem);
    }
}

// Removes item properties matching the given spell Id (need to be set with ApplyItemPropertyTaggedInfo)
void RemoveItemPropertiesMatchingSpellId(object oItem, int nSpellId)
{
    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        if (GetItemPropertySpellId(ipCheck) == nSpellId)
        {
            RemoveItemProperty(oItem, ipCheck);
        }
        ipCheck = GetNextItemProperty(oItem);
    }
}

// Returns a the item property tagged with Json relating to the given fields
itemproperty ApplyItemPropertyTaggedInfo(itemproperty ipProperty, int nSpellId, object oCreator, int nCasterLevel, int nSpellSaveDC, int nMetaMagic)
{
    // We use a Json object dumped to string for this.
    json jObject = JsonObject();

    jObject = JsonObjectSet(jObject, JSON_FIELD_OVERHAUL, JsonInt(OVERHAUL_VERSION));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLID, JsonInt(nSpellId));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CREATOR, JsonString(ObjectToString(oCreator)));
    jObject = JsonObjectSet(jObject, JSON_FIELD_CASTERLEVEL, JsonInt(nCasterLevel));
    jObject = JsonObjectSet(jObject, JSON_FIELD_SPELLSAVEDC, JsonInt(nSpellSaveDC));
    jObject = JsonObjectSet(jObject, JSON_FIELD_METAMAGIC, JsonInt(nMetaMagic));

    OP_Debug("[ApplyItemPropertyTaggedInfo] Setting JSON:" + JsonDump(jObject));

    return TagItemProperty(ipProperty, JsonDump(jObject));
}

// Retrieves the item properties given field as integer (need to be set with ApplyItemPropertyTaggedInfo)
// * sField - JSON_FIELD_* to find
// Returns nDefault if not found
int GetItemPropertyTaggedIntField(itemproperty ipProperty, string sField, int nDefault = 0)
{
    string sTag = GetItemPropertyTag(ipProperty);

    // Lots of items won't have this tagged so exit early!
    if (sTag == "") return nDefault;

    //OP_Debug("[GetItemPropertySpellId] TAG:" + sTag);
    json jObject = JsonParse(sTag);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        OP_Debug("[GetItemPropertyTaggedIntField] No found valid Json. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return nDefault;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetItemPropertyTaggedIntField] Json found but not Overhaul. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
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
object GetItemPropertyTaggedObjectField(itemproperty ipProperty, string sField)
{
    string sTag = GetItemPropertyTag(ipProperty);

    // Lots of items won't have this tagged so exit early!
    if (sTag == "") return OBJECT_INVALID;

    //OP_Debug("[GetItemPropertySpellId] TAG:" + sTag);
    json jObject = JsonParse(sTag);

    if (JsonGetType(jObject) == JSON_TYPE_NULL)
    {
        OP_Debug("[GetItemPropertyTaggedObjectField] No found valid Json. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
        return OBJECT_INVALID;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, JSON_FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetItemPropertyTaggedObjectField] Json found but not Overhaul. Error: " + JsonGetError(jObject), LOG_LEVEL_ERROR);
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

// Retrieves the item properties spell Id (need to be set with ApplyItemPropertyTaggedInfo)
// Returns SPELL_INVALID if not found
int GetItemPropertySpellId(itemproperty ipProperty)
{
    return GetItemPropertyTaggedIntField(ipProperty, JSON_FIELD_SPELLID, -1);
}

// Retrieves the item properties creator (need to be set with ApplyItemPropertyTaggedInfo)
// Returns OBJECT_INVALID if not found
object GetItemPropertyCreator(itemproperty ipProperty)
{
    return GetItemPropertyTaggedObjectField(ipProperty, JSON_FIELD_CREATOR);
}

// Retrieves the item properties caster level (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertyCasterLevel(itemproperty ipProperty)
{
    return GetItemPropertyTaggedIntField(ipProperty, JSON_FIELD_CASTERLEVEL, 0);
}

// Retrieves the item properties spell save DC (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertySpellSaveDC(itemproperty ipProperty)
{
    return GetItemPropertyTaggedIntField(ipProperty, JSON_FIELD_SPELLSAVEDC, 0);
}

// Retrieves the item properties metamagic (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertyMetaMagic(itemproperty ipProperty)
{
    return GetItemPropertyTaggedIntField(ipProperty, JSON_FIELD_METAMAGIC, 0);
}
