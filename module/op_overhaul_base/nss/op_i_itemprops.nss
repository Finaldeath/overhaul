//::///////////////////////////////////////////////
//:: Item Properties Include
//:: op_i_itemprops.nss
//:://////////////////////////////////////////////
/*
    Item property include.

    We are not going to be hooking into the fact item properties are technically
    effects with spell Ids etc.


*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_debug"
#include "utl_i_itemprop"

// Fields for the Json tag storage on item properties

const string FIELD_OVERHAUL    = "overhaul";   // Int
const int OVERHAUL_VERSION     = 1;            // Matching check for FIELD_OVERHAUL
const string FIELD_SPELLID     = "spellid";    // Int
const string FIELD_CREATOR     = "creator";    // String (OID)
const string FIELD_CASTERLEVEL = "casterlevel";// Int
const string FIELD_SPELLSAVEDC = "spellsavedc";// Int

// Debugs the given item and it's properties
void DebugItemProperties(object oItem);

// Returns a string with the duration of the property information
string GetItemPropertyDurationString(itemproperty ipProperty);

// Removes item properties with the matching tag
void RemoveItemPropertiesMatchingTag(object oItem, string sTag);

// Removes item properties matching the given spell Id (need to be set with ApplyItemPropertyTaggedInfo)
void RemoveItemPropertiesMatchingSpellId(object oItem, int nSpellId);

// Returns a the item property tagged with Json relating to the given fields
itemproperty ApplyItemPropertyTaggedInfo(itemproperty ipProperty, int nSpellId, object oCreator, int nCasterLevel, int nSpellSaveDC);

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
itemproperty ApplyItemPropertyTaggedInfo(itemproperty ipProperty, int nSpellId, object oCreator, int nCasterLevel, int nSpellSaveDC)
{
    // We use a Json object dumped to string for this.
    json jObject = JsonObject();

    jObject = JsonObjectSet(jObject, FIELD_OVERHAUL, JsonInt(OVERHAUL_VERSION));
    jObject = JsonObjectSet(jObject, FIELD_SPELLID, JsonInt(nSpellId));
    jObject = JsonObjectSet(jObject, FIELD_CREATOR, JsonString(ObjectToString(oCreator)));
    jObject = JsonObjectSet(jObject, FIELD_CASTERLEVEL, JsonInt(nCasterLevel));
    jObject = JsonObjectSet(jObject, FIELD_SPELLSAVEDC, JsonInt(nSpellSaveDC));

    OP_Debug("[ApplyItemPropertyTaggedInfo] Setting JSON:" + JsonDump(jObject));

    return TagItemProperty(ipProperty, JsonDump(jObject));
}

// Retrieves the item properties given field as integer (need to be set with ApplyItemPropertyTaggedInfo)
// * sField - FIELD_* to find
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
        OP_Debug("[GetItemPropertySpellId] No found valid Json. Error: " + JsonGetError(jObject));
        return nDefault;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetItemPropertySpellId] Json found but not Overhaul. Error: " + JsonGetError(jObject));
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
// * sField - FIELD_* to find
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
        OP_Debug("[GetItemPropertyCreator] No found valid Json. Error: " + JsonGetError(jObject));
        return OBJECT_INVALID;
    }
    // Is it overhaul?
    if (JsonGetInt(JsonObjectGet(jObject, FIELD_OVERHAUL)) != OVERHAUL_VERSION)
    {
        OP_Debug("[GetItemPropertySpellId] Json found but not Overhaul. Error: " + JsonGetError(jObject));
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
    return GetItemPropertyTaggedIntField(ipProperty, FIELD_SPELLID, -1);
}

// Retrieves the item properties creator (need to be set with ApplyItemPropertyTaggedInfo)
// Returns OBJECT_INVALID if not found
object GetItemPropertyCreator(itemproperty ipProperty)
{
    return GetItemPropertyTaggedObjectField(ipProperty, FIELD_CREATOR);
}

// Retrieves the item properties caster level (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertyCasterLevel(itemproperty ipProperty)
{
    return GetItemPropertyTaggedIntField(ipProperty, FIELD_CASTERLEVEL, 0);
}

// Retrieves the item properties spell save DC (need to be set with ApplyItemPropertyTaggedInfo)
// Returns 0 if not found
int GetItemPropertySpellSaveDC(itemproperty ipProperty)
{
    return GetItemPropertyTaggedIntField(ipProperty, FIELD_SPELLSAVEDC, -1);
}
