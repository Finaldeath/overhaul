//::///////////////////////////////////////////////
//:: Overhaul Include: Polymorph
//:: op_i_polymorph
//:://////////////////////////////////////////////
/*
    Polymorph function such as the Shifter copy-properties and others.

    There are two aspects, item property copying and new effects tied to
    EffectPolymorph with EffectLinkEffects.

    Also: Need to think, should we have an option to have a form not have any
    item equipped by using DestroyObject on the given item, for Monks? This
    would allow Monk progression of attacks in more polymorph forms.

    --------------------------
    Copying of item properties
    --------------------------
    Bioware copied item properties from these items:
    * Armor -> Hide: Armor, Shield, Helmet
    * Items -> Hide: Rings, Amulet, Cloak, Boots, Belt
    * Weapon -> Weapon: Depends if ranged or not. Right hand weapon only.

    This is retained because:
    * We can't apply some properties with Effects (eg: Keen)
    * Keeps things simpler

    --------------------------
    Conversion of Item Properties to Effects
    --------------------------

    This could be done in cases where:

    * the item properties don't properly copy  such as when items are not in the
      above list (eg; Ranged Weapon -> Melee Weapon or secondary weapons, and
      also oddly the "arms" slot)
    * when stacking of the item properties is off such as AC bonuses being just
      tied to the AC type of the hide, ie Deflection.

    There are other cases of oddities of things stacking.

    Won't ever be perfect right now (can't convert a second weapon's Keen
    property onto a nonexistent weapon!) but it's better than before.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "utl_i_item"
#include "op_i_itemprops"
#include "op_i_spells"

const string FIELD_ITEM_PROPERTY_TYPE = "iptype";
const string FIELD_ITEM_PROPERTY_SUBTYPE = "ipsubtype";
const string FIELD_ITEM_PROPERTY_COST_TABLE = "ipcosttable";
const string FIELD_ITEM_PROPERTY_COST_TABLE_VALUE = "ipcosttablevalue";
const string FIELD_ITEM_PROPERTY_PARAM1 = "ipparam1";
const string FIELD_ITEM_PROPERTY_PARAM_VALUE = "ipparam1value";

// Applies the nPolymorph to oCreature permamently
// Also does the Bioware-style item copying for the given polymorph type for oCreature
void ApplyPolymorphAndItemMerging(object oCreature, int nPolymorph);

// Returns a link of effects which are effectively the item properties that
// oCreature has at the given moment.
// Will not merge certain ones, which need to be copied with PolmyorphCopyItemProperties.
// * NOTE: Do not call on something already polymorphed. Remove it first!
effect GetPolymorphMergeItemProperties(object oCreature, int nPolymorph);

// A given JSON translated item property gets translated to an effect
effect GetItemPropertyEquivalentEffect(json jItemProperty);

// Copies appropriate item properites from oSource to oTarget
// Specifically:
// - Keen
// - Mighty Criticals
// -
// Ones we never really copy:
// - Extra Melee / Ranged Damage Type
// - Darkvision
// - Weight related properties
// - Usage related properties
// - Holy Avenger
// - Monster Damge properies
// - On Hit: Cast Spell
void PolmyorphCopyItemProperties(object oSource, object oTarget);


// Applies the nPolymorph to oCreature permamently
// Also does the Bioware-style item copying for the given polymorph type for oCreature
void ApplyPolymorphAndItemMerging(object oCreature, int nPolymorph)
{
    int bMergeWeapon = (StringToInt(Get2DAString("polymorph", "MergeW", nPolymorph)) == 1);
    int bMergeArmor  = (StringToInt(Get2DAString("polymorph", "MergeA", nPolymorph)) == 1);
    int bMergeItems  = (StringToInt(Get2DAString("polymorph", "MergeI", nPolymorph)) == 1);

    // Items to pass to the next function
    object oWeaponOld = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCreature);
    object oArmorOld  = GetItemInSlot(INVENTORY_SLOT_CHEST, oCreature);
    object oRing1Old  = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oCreature);
    object oRing2Old  = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oCreature);
    object oAmuletOld = GetItemInSlot(INVENTORY_SLOT_NECK, oCreature);
    object oCloakOld  = GetItemInSlot(INVENTORY_SLOT_CLOAK, oCreature);
    object oBootsOld  = GetItemInSlot(INVENTORY_SLOT_BOOTS, oCreature);
    object oBeltOld   = GetItemInSlot(INVENTORY_SLOT_BELT, oCreature);
    object oHelmetOld = GetItemInSlot(INVENTORY_SLOT_HEAD, oCreature);
    object oShield    = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCreature);

    if (GetIsObjectValid(oShield))
    {
        if (GetBaseItemType(oShield) != BASE_ITEM_LARGESHIELD &&
            GetBaseItemType(oShield) != BASE_ITEM_SMALLSHIELD &&
            GetBaseItemType(oShield) != BASE_ITEM_TOWERSHIELD)
        {
            oShield = OBJECT_INVALID;
        }
    }

    effect ePoly = ExtraordinaryEffect(EffectPolymorph(nPolymorph));
    ClearAllActions(FALSE, oTarget); // prevents an exploit

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, oTarget);

    object oWeaponNew = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
    object oArmorNew = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oTarget);

    // Identify weapon
    SetIdentified(oWeaponNew, TRUE);

    if (bMergeWeapon)
    {
        CopyItemPropertiesPolymorph(oWeaponOld, oWeaponNew, TRUE);
    }
    if (bMergeArmor)
    {
        // Merge item properties from Armor, helmet and shield
        CopyItemPropertiesPolymorph(oArmorOld, oArmorNew);
        CopyItemPropertiesPolymorph(oHelmetOld, oArmorNew);
        CopyItemPropertiesPolymorph(oShield, oArmorNew);
    }
    if (bMergeItems)
    {
        // Merge item properties from from rings, amulets, cloak, boots, belt
        CopyItemPropertiesPolymorph(oRing1Old, oArmorNew);
        CopyItemPropertiesPolymorph(oRing2Old, oArmorNew);
        CopyItemPropertiesPolymorph(oAmuletOld, oArmorNew);
        CopyItemPropertiesPolymorph(oCloakOld, oArmorNew);
        CopyItemPropertiesPolymorph(oBootsOld, oArmorNew);
        CopyItemPropertiesPolymorph(oBeltOld, oArmorNew);
    }
}


// Returns a link of effects which are effectively the item properties that
// oCreature has at the given moment.
// Will not merge certain ones, which need to be copied with PolmyorphCopyItemProperties.
// * NOTE: Do not call on something already polymorphed. Remove it first!
effect GetPolymorphMergeItemProperties(object oCreature, int nPolymorph)
{
    effect eReturn;

    // We loop each item, and make an array of item properties to begin with
    // that contains a load of duplicates and whatever
    // We do not copy over monster slots, ie natural changes are kept natural!

    json jArray = JsonArray();
    int nSlot;
    for (nSlot = 0; nSlot <= 13; nSlot++)
    {
        object oItem = GetItemInSlot(nSlot, oCreature);

        if (GetIsObjectValid(oItem))
        {
            itemproperty ipCheck = GetFirstItemProperty(oItem);
            while (GetIsItemPropertyValid(ipCheck))
            {
                // Only permanent changes are copied
                if (GetItemPropertyDurationType(ipCheck) == DURATION_TYPE_PERMANENT)
                {
                    // Copy item properties to the array
                    json jObject = JsonObject();

                    jObject = JsonObjectSet(jObject, FIELD_ITEM_PROPERTY_TYPE, JsonInt(GetItemPropertyType(ipCheck)));
                    jObject = JsonObjectSet(jObject, FIELD_ITEM_PROPERTY_SUBTYPE, JsonInt(GetItemPropertySubType(ipCheck)));
                    jObject = JsonObjectSet(jObject, FIELD_ITEM_PROPERTY_COST_TABLE, JsonInt(GetItemPropertyCostTable(ipCheck)));
                    jObject = JsonObjectSet(jObject, FIELD_ITEM_PROPERTY_COST_TABLE_VALUE, JsonInt(GetItemPropertyCostTableValue(ipCheck)));
                    jObject = JsonObjectSet(jObject, FIELD_ITEM_PROPERTY_PARAM1, JsonInt(GetItemPropertyParam1(ipCheck)));
                    jObject = JsonObjectSet(jObject, FIELD_ITEM_PROPERTY_PARAM_VALUE, JsonInt(GetItemPropertyParam1Value(ipCheck)));

                    jArray = JsonArrayInsert(jArray, jObject);
                }
                ipCheck = GetNextItemProperty(oItem);
            }
        }
    }

    // Now we have an array to sort through and translate the item properties to effects
    // Sort by type so we can check when we've got to the next item property type
    jArray = JsonArrayTransform(jArray, JSON_ARRAY_SORT_ASCENDING);

    int nIndex, nCurrentProperty = -1, bApplyBestOfType = FALSE;
    json jBestPropertyOfType;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        json jObject = JsonArrayGet(jArray, nIndex);

        // Get the property ID
        int nProperty = JsonGetInt(JsonObjectGet(jObject, FIELD_ITEM_PROPERTY_TYPE));

        if (nProperty != nCurrentProperty)
        {
            if (bApplyBestOfType)
            {
                // Apply the last one
                eReturn = EffectLinkEffects(eReturn, GetItemPropertyEquivalentEffect(jBestPropertyOfType));
            }
        }
        else if (bApplyBestOfType)
        {
            // Check this property against the last one and see if it's better

        }
        else
        {
            // First one of this type (possibly)
            nCurrentProperty = nProperty;

            // Depending on the type we will apply the best/last one or just apply instantly
            int bApplyNow = FALSE;
            switch (nProperty)
            {
                case ITEM_PROPERTY_ABILITY_BONUS:
                case ITEM_PROPERTY_AC_BONUS:
                case ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_AC_BONUS_VS_DAMAGE_TYPE:
                case ITEM_PROPERTY_AC_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_AC_BONUS_VS_SPECIFIC_ALIGNMENT:
                //case ITEM_PROPERTY_ADDITIONAL:
                //case ITEM_PROPERTY_ARCANE_SPELL_FAILURE:
                case ITEM_PROPERTY_ATTACK_BONUS:
                case ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT:
                //case ITEM_PROPERTY_BASE_ITEM_WEIGHT_REDUCTION:
                case ITEM_PROPERTY_BONUS_FEAT:
                //case ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N:
                //case ITEM_PROPERTY_CAST_SPELL:
                case ITEM_PROPERTY_DAMAGE_BONUS:
                case ITEM_PROPERTY_DAMAGE_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_DAMAGE_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_DAMAGE_BONUS_VS_SPECIFIC_ALIGNMENT:
                case ITEM_PROPERTY_DAMAGE_REDUCTION:
                case ITEM_PROPERTY_DAMAGE_RESISTANCE:
                case ITEM_PROPERTY_DAMAGE_VULNERABILITY:
                //case ITEM_PROPERTY_DARKVISION:
                case ITEM_PROPERTY_DECREASED_ABILITY_SCORE:
                case ITEM_PROPERTY_DECREASED_AC:
                case ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER:
                case ITEM_PROPERTY_DECREASED_DAMAGE:
                case ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER:
                case ITEM_PROPERTY_DECREASED_SAVING_THROWS:
                case ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC:
                case ITEM_PROPERTY_DECREASED_SKILL_MODIFIER:
                //case ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT:
                case ITEM_PROPERTY_EXTRA_MELEE_DAMAGE_TYPE:
                case ITEM_PROPERTY_EXTRA_RANGED_DAMAGE_TYPE:
                case ITEM_PROPERTY_FREEDOM_OF_MOVEMENT:
                case ITEM_PROPERTY_HASTE:
                //case ITEM_PROPERTY_HEALERS_KIT:
                case ITEM_PROPERTY_HOLY_AVENGER:
                case ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE:
                case ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS:
                case ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL:
                case ITEM_PROPERTY_IMMUNITY_SPELLS_BY_LEVEL:
                case ITEM_PROPERTY_IMMUNITY_SPELL_SCHOOL:
                case ITEM_PROPERTY_IMPROVED_EVASION:
                //case ITEM_PROPERTY_KEEN:
                case ITEM_PROPERTY_LIGHT:
                case ITEM_PROPERTY_MASSIVE_CRITICALS:
                //case ITEM_PROPERTY_MATERIAL:
                case ITEM_PROPERTY_MIGHTY:
                case ITEM_PROPERTY_MIND_BLANK:
                //case ITEM_PROPERTY_MONSTER_DAMAGE:
                case ITEM_PROPERTY_NO_DAMAGE:
                //case ITEM_PROPERTY_ONHITCASTSPELL:
                //case ITEM_PROPERTY_ON_HIT_PROPERTIES:
                //case ITEM_PROPERTY_ON_MONSTER_HIT:
                //case ITEM_PROPERTY_QUALITY:
                case ITEM_PROPERTY_REGENERATION:
                case ITEM_PROPERTY_REGENERATION_VAMPIRIC:
                case ITEM_PROPERTY_SAVING_THROW_BONUS:
                case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC:
                case ITEM_PROPERTY_SKILL_BONUS:
                //case ITEM_PROPERTY_SPECIAL_WALK:
                case ITEM_PROPERTY_SPELL_RESISTANCE:
                //case ITEM_PROPERTY_THIEVES_TOOLS:
                //case ITEM_PROPERTY_TRAP:
                case ITEM_PROPERTY_TRUE_SEEING:
                case ITEM_PROPERTY_TURN_RESISTANCE:
                //case ITEM_PROPERTY_UNLIMITED_AMMUNITION:
                //case ITEM_PROPERTY_USE_LIMITATION_ALIGNMENT_GROUP:
                //case ITEM_PROPERTY_USE_LIMITATION_CLASS:
                //case ITEM_PROPERTY_USE_LIMITATION_RACIAL_TYPE:
                //case ITEM_PROPERTY_USE_LIMITATION_SPECIFIC_ALIGNMENT:
                //case ITEM_PROPERTY_USE_LIMITATION_TILESET:
                //case ITEM_PROPERTY_VISUALEFFECT:
                //case ITEM_PROPERTY_WEIGHT_INCREASE:
            }
        }

    }
    return eReturn;
}

// A given JSON translated item property gets translated to an effect
effect GetItemPropertyEquivalentEffect(json jItemProperty)
{
    effect eEffect;

    int nType = JsonGetInt(JsonObjectGet(jItemProperty, FIELD_ITEM_PROPERTY_TYPE));
    int nSubtype = JsonGetInt(JsonObjectGet(jItemProperty, FIELD_ITEM_PROPERTY_SUBTYPE));

    switch (nType)
    {

    }

    return eEffect;
}
