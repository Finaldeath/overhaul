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

    Stacking

    What do we do about stacking of item properties? Do we just remove all existing
    temporary item properties? That might be the best idea to be honest. Bioware
    used IPSafeAddItemProperty() usually with X2_IP_ADDPROP_POLICY_REPLACE_EXISTING
    which is "remove any property of the same type, subtype, durationtype before
    adding".

    Our ApplySafeItemProperty() is simplified we will always:
    * Check and remove any spell Ids that match on the target weapon
    * Always remove any matching properties of the same type/subtype/durationtype
    * Do not apply the effect if it is of a certain type (On Hit property types)
      where already one of that type already exists.

    Dispel Magic
    This is handled now on checking equipped items (and dispelling all of that
    spell Id on that item). Creature weapons are checked for all 3 at once.
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
#include "utl_i_item"

// Debugs the given item and it's properties
void DebugItemProperties(object oItem);

// This checks if we can add a given item property to ipProperty. It check these things:
// * Do not apply the effect if it is of a certain type (On Hit property types)
//   where already one of that type already exists.
int GetCanApplySafeItemProperty(object oItem, itemproperty ipProperty);

// This automatically handles adding magical item properties. It will:
// * Check and remove any spell Ids that match on the target weapon
// * Always remove any matching properties of the same type/subtype/durationtype
// * Do not apply the effect if it is of a certain type (On Hit property types)
//   where already one of that type already exists.
// ipProperty will be tagged with the current spell Id, caster level etc. for dispel magic and other purposes.
int ApplySafeItemProperty(object oItem, itemproperty ipProperty, float fDuration, int nSpellId, object oCaster, int nCasterLevel, int nSpellSaveDC, int nMetaMagic);

// Simply applies ipProperty for fDuration on oItem with metadata with no checks whatsoever.
// Can be used to add 2 properties to an item of the same type if used after ApplySafeItemProperty().
void ApplyItemProperty(object oItem, itemproperty ipProperty, float fDuration, int nSpellId, object oCaster, int nCasterLevel, int nSpellSaveDC, int nMetaMagic);

// Returns TRUE if there are any item properties matching the given property
int GetItemHasMatchingItemProperty(object oItem, itemproperty ipProperty, int nDurationType = DURATION_TYPE_TEMPORARY, int bCheckSubType = TRUE, int bCheckCostTable = TRUE, int bCheckParam1Value = TRUE);

// Returns TRUE if the given item has nSpellId applied to it
int GetItemHasSpellCastOnIt(object oItem, int nSpellId);

// Removes any temporary item properties matching ipProperty's type
// If it has a spell Id it will then also remove all properties matching the given spell Id
int RemoveItemMatchingItemProperty(object oItem, itemproperty ipProperty);

// Gets an appropriate melee weapon (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetMeleeWeaponToCastSpellOn(object oTarget, int nSpellId);

// Gets an appropriate ranged weapon (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetRangedWeaponToCastSpellOn(object oTarget, int nSpellId);

// Gets an appropriate equippable item (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetEquippableItemToCastSpellOn(object oTarget, int nSpellId);

// Gets an appropriate item (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetItemToCastSpellOn(object oTarget, int nBaseItemType, int nSpellId);

// Dispels magical item properties on oItem
// Note: This will attempt to just dispel all present item properties since this should
// only be called when it's targeted on a single creature or an item on the ground/in inventory
// - bCreatureItem - If set oItem is ignored (although the possessor is used) and it gets one of
//   the creature items to remove things from, and applies it to the other 2.
int DispelMagicalItemProperties(object oItem, object oCaster, int nCasterLevel, int bCreatureItem = FALSE);

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

// This checks if we can add a given item property to ipProperty. It check these things:
// * Do not apply the effect if it is of a certain type (On Hit property types)
//   where already one of that type already exists.
int GetCanApplySafeItemProperty(object oItem, itemproperty ipProperty)
{
    // Safely can apply if invalid!
    if (!GetIsItemPropertyValid(ipProperty)) return TRUE;

    // For some item properties we want to make sure no item properties of this type exist
    int nPropertyType = GetItemPropertyType(ipProperty);
    if (nPropertyType == ITEM_PROPERTY_ON_HIT_PROPERTIES ||
        nPropertyType == ITEM_PROPERTY_ON_MONSTER_HIT ||
        nPropertyType == ITEM_PROPERTY_ONHITCASTSPELL)
    {
        // Any matching permanent properties we stop here
        if (GetItemHasMatchingItemProperty(oItem, ipProperty, DURATION_TYPE_PERMANENT, FALSE, FALSE, FALSE))
        {
            return FALSE;
        }
    }
    // We may want additional checks here but leaving for now.

    return TRUE;
}

// This automatically handles adding magical item properties. It will:
// * Check and remove any spell Ids that match on the target weapon
// * Always remove any matching properties of the same type/subtype/durationtype
// * Do not apply the effect if it is of a certain type (On Hit property types)
//   where already one of that type already exists.
// ipProperty will be tagged with the current spell Id, caster level etc. for dispel magic and other purposes.
int ApplySafeItemProperty(object oItem, itemproperty ipProperty, float fDuration, int nSpellId, object oCaster, int nCasterLevel, int nSpellSaveDC, int nMetaMagic)
{
    // Error checking
    if (!GetIsItemPropertyValid(ipProperty)) { OP_Debug("[ApplySafeItemProperty] Invalid input item property."); return FALSE; }
    if (fDuration <= 0.0) { OP_Debug("[ApplySafeItemProperty] Invalid fDuration: " + FloatToString(fDuration)); return FALSE; }

    // First for some item properties we want to make sure no item properties of this type exist
    if (!GetCanApplySafeItemProperty(oItem, ipProperty))
    {
        return FALSE;
    }

    // Remove any that match the type but are temporary
    int nRemoved = RemoveItemMatchingItemProperty(oItem, ipProperty);

    SpeakString("nRemoved = " + IntToString(nRemoved));

    // Remove any that match the spell Id
    //RemoveItemPropertiesMatchingSpellId(oItem, nSpellId);

    ApplyItemProperty(oItem, ipProperty, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);

    return TRUE;
}

// Simply applies ipProperty for fDuration on oItem with metadata with no checks whatsoever.
// Can be used to add 2 properties to an item of the same type if used after ApplySafeItemProperty().
void ApplyItemProperty(object oItem, itemproperty ipProperty, float fDuration, int nSpellId, object oCaster, int nCasterLevel, int nSpellSaveDC, int nMetaMagic)
{
    // No debug messages since we can use this on invalid properties (they just don't apply)
    if (!GetIsItemPropertyValid(ipProperty)) return;
    if (fDuration <= 0.0) return;

    // Add metadata
    ipProperty = ApplyItemPropertyTaggedInfo(ipProperty, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);

    // Apply it
    AddItemProperty(DURATION_TYPE_TEMPORARY, ipProperty, oItem, fDuration);
}


// Returns TRUE if there are any item properties matching the given property
int GetItemHasMatchingItemProperty(object oItem, itemproperty ipProperty, int nDurationType = DURATION_TYPE_TEMPORARY, int bCheckSubType = TRUE, int bCheckCostTable = TRUE, int bCheckParam1Value = TRUE)
{
    int nType = GetItemPropertyType(ipProperty);
    int nSubType = GetItemPropertySubType(ipProperty);
    int nCostTableValue = GetItemPropertyCostTableValue(ipProperty);
    int nParam1Value = GetItemPropertyParam1Value(ipProperty);

    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        if (GetItemPropertyType(ipCheck) == nType &&
           (!bCheckSubType || GetItemPropertySubType(ipCheck) == nSubType) &&
           (!bCheckCostTable || GetItemPropertyCostTableValue(ipCheck) == nCostTableValue) &&
           (!bCheckParam1Value || GetItemPropertyParam1Value(ipCheck) == nParam1Value))
        {
            return TRUE;
        }
        ipCheck = GetNextItemProperty(oItem);
    }
    return FALSE;
}

// Returns TRUE if the given item has nSpellId applied to it
int GetItemHasSpellCastOnIt(object oItem, int nSpellId)
{
    if (nSpellId == SPELL_INVALID) return FALSE;

    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        if (GetItemPropertySpellId(ipCheck) == nSpellId)
        {
            return TRUE;
        }
        ipCheck = GetNextItemProperty(oItem);
    }
    return FALSE;
}

// Removes any temporary item properties matching ipProperty's type
// If it has a spell Id it will then also remove all properties matching the given spell Id
int RemoveItemMatchingItemProperty(object oItem, itemproperty ipProperty)
{
    int nType = GetItemPropertyType(ipProperty);
    int nAmount = 0;
    json jArrayOfSpellIds = JsonArray();

    SpeakString("RemoveItemMatchingItemProperty");
    DebugItemProperties(oItem);

    itemproperty ipCheck = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipCheck))
    {
        if (GetItemPropertyDurationType(ipCheck) == DURATION_TYPE_TEMPORARY &&
            GetItemPropertyType(ipCheck) == nType)
        {
            RemoveItemProperty(oItem, ipCheck);

            int nSpellId = GetItemPropertySpellId(ipCheck);
            if (nSpellId != SPELL_INVALID)
            {
                jArrayOfSpellIds = JsonArrayInsert(jArrayOfSpellIds, JsonInt(nSpellId));
            }
            nAmount++;
        }
        ipCheck = GetNextItemProperty(oItem);
    }
    // Remove any matching spell Ids (eg we removed the flame damage, but also need to clear the VFX)
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArrayOfSpellIds); nIndex++)
    {
        nSpellId = JsonGetInt(JsonArrayGet(jArrayOfSpellIds, nIndex));
        RemoveItemPropertiesMatchingSpellId(oItem, nSpellId);
    }
    return nAmount;
}

// Gets an appropriate melee weapon (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetMeleeWeaponToCastSpellOn(object oTarget, int nSpellId)
{
    // Does oTarget itself match?
    if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        // If directly targeted it doesn't matter if it's already got the spell Id
        if (GetItemIsMelee(oTarget))
        {
            return oTarget;
        }
    }
    // Check equipped items
    else if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        int nSlot;
        for (nSlot = 0; nSlot < NUM_INVENTORY_SLOTS; nSlot++)
        {
            object oItem = GetItemInSlot(nSlot, oTarget);

            if (GetItemIsMelee(oItem) && !GetItemHasSpellCastOnIt(oItem, nSpellId))
            {
                return oItem;
            }
        }
    }

    // Failure message
    // 83615 * Spell Failed - Target must be a melee weapon or creature with a melee weapon equipped *
    SendMessageToPCByStrRef(OBJECT_SELF, 83615);
    return OBJECT_INVALID;
}

// Gets an appropriate ranged weapon (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetRangedWeaponToCastSpellOn(object oTarget, int nSpellId)
{
    // Does oTarget itself match?
    if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        // If directly targeted it doesn't matter if it's already got the spell Id
        if (GetItemIsRanged(oTarget))
        {
            return oTarget;
        }
    }
    // Check equipped items
    else if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        int nSlot;
        for (nSlot = 0; nSlot < NUM_INVENTORY_SLOTS; nSlot++)
        {
            object oItem = GetItemInSlot(nSlot, oTarget);

            if (GetIsObjectValid(oItem) && GetItemIsRanged(oItem) && !GetItemHasSpellCastOnIt(oItem, nSpellId))
            {
                return oItem;
            }
        }
    }

    // Failure message
    SendMessageToPC(OBJECT_SELF, "* Spell Failed - Target must be a ranged weapon or creature with a ranged weapon equipped *");
    return OBJECT_INVALID;
}

// Gets an appropriate equippable item (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetEquippableItemToCastSpellOn(object oTarget, int nSpellId)
{
    // Does oTarget itself match?
    if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        // If directly targeted it doesn't matter if it's already got the spell Id
        if (Get2DAString("baseitems","EquipableSlots", GetBaseItemType(oTarget)) != "0x00000")
        {
            return oTarget;
        }
    }
    // Check equipped items
    else if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        int nSlot;
        for (nSlot = 0; nSlot < NUM_INVENTORY_SLOTS; nSlot++)
        {
            object oItem = GetItemInSlot(nSlot, oTarget);

            if (GetIsObjectValid(oItem) &&
                Get2DAString("baseitems","EquipableSlots", GetBaseItemType(oItem)) != "0x00000" &&
               !GetItemHasSpellCastOnIt(oItem, nSpellId))
            {
                return oItem;
            }
        }
    }
    // Failure message
    // 83326 * Spell failed - Target must be creature or an item that can be equipped *
    SendMessageToPCByStrRef(OBJECT_SELF, 83326);
    return OBJECT_INVALID;
}

// Gets an appropriate item (either oTarget, or something oTarget has equipped) without nSpellId
// Will provide automatic feedback to OBJECT_SELF (assumed caster) if nothing is found.
object GetItemToCastSpellOn(object oTarget, int nBaseItemType, int nSpellId)
{
    // Does oTarget itself match?
    if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        // If directly targeted it doesn't matter if it's already got the spell Id
        if (GetBaseItemType(oTarget) == nBaseItemType)
        {
            return oTarget;
        }
    }
    // Check equipped items
    else if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        int nSlot;
        for (nSlot = 0; nSlot < NUM_INVENTORY_SLOTS; nSlot++)
        {
            object oItem = GetItemInSlot(nSlot, oTarget);

            if (GetIsObjectValid(oItem) &&
                GetBaseItemType(oItem) == nBaseItemType &&
               !GetItemHasSpellCastOnIt(oItem, nSpellId))
            {
                return oItem;
            }
        }
    }
    // Failure message
    SendMessageToPC(OBJECT_SELF, "* Spell failed - Target must be a " + GetStringByStrRef(StringToInt(Get2DAString("baseitems", "Name", nBaseItemType))) + " type item or be a creature with one equipped *");
    return OBJECT_INVALID;
}

// Dispels magical item properties on oItem
// Note: This will attempt to just dispel all present item properties since this should
// only be called when it's targeted on a single creature or an item on the ground/in inventory
// - bCreatureItem - If set oItem is ignored (although the possessor is used) and it gets one of
//   the creature items to remove things from, and applies it to the other 2.
int DispelMagicalItemProperties(object oItem, object oCaster, int nCasterLevel, int bCreatureItem = FALSE)
{
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

    // Count amount
    int nAmount = 0;

    json jIgnoreArray = JsonArray();
    json jDispelArray = JsonArray();

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
