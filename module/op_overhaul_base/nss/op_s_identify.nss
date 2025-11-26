//:://////////////////////////////////////////////
//:: Identify spells
//:: op_s_identify
//:://////////////////////////////////////////////
/*
    Identify and Read Magic and other related spells.

    Identify
    Identify reveals the magical properties of a single unidentified item.

    Read Magic
    You identify a spell scroll or potions contents.

    Legend Lore
    This spell instantly identifies all the items in the casters inventory. For
    the purposes of identification you gain +10 plus 1 per 2 caster level ranks
    in your Lore skill.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // TODO a helper for this would be to cast on a creature and it reads the
    // magic of the first unidentified scroll (Read Magic) or item (Identify) in
    // their inventory.

    if (nSpellId == SPELL_LEGEND_LORE)
    {
        // We will identify all items we can with an increased lore value
        int nLore = GetSkillRank(SKILL_LORE, oCaster) + 10 + (nCasterLevel / 2);

        int nMaxValue = MAX_INT;  // ie anything

        // We can go over the row limit
        if (nLore <= Get2DARowCount("skillvsitemcost"))
        {
            nMaxValue = StringToInt(Get2DAString("skillvsitemcost", "DeviceCostMax", nLore));
        }

        // Loop the casters inventory
        object oItem = GetFirstItemInInventory(oCaster);
        while (GetIsObjectValid(oItem))
        {
            if (!GetIdentified(oItem))
            {
                // Need to identify here to get the true value
                SetIdentified(oItem, TRUE);
                if (nMaxValue >= GetGoldPieceValue(oItem))
                {
                    SetIdentified(oItem, TRUE);
                    SendMessageToPC(oCaster, "*You identify: " + GetName(oItem) + "*");
                }
                else
                {
                    SetIdentified(oItem, FALSE);
                }
            }
            oItem = GetNextItemInInventory(oCaster);
        }
        return;
    }
    else if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        int nBaseItemType = GetBaseItemType(oTarget);
        if (nSpellId == SPELL_IDENTIFY ||
            // Read Magic
            nBaseItemType == BASE_ITEM_BLANK_SCROLL ||
            nBaseItemType == BASE_ITEM_ENCHANTED_SCROLL ||
            nBaseItemType == BASE_ITEM_SCROLL ||
            nBaseItemType == BASE_ITEM_SPELLSCROLL ||
            nBaseItemType == BASE_ITEM_BLANK_POTION ||
            nBaseItemType == BASE_ITEM_ENCHANTED_POTION ||
            nBaseItemType == BASE_ITEM_POTIONS)
        {
            if (GetIsObjectValid(GetItemPossessor(oTarget)))
            {
                SignalSpellCastAt(GetItemPossessor(oTarget));
            }
            if (!GetIdentified(oTarget))
            {
                // Identify!
                SetIdentified(oTarget, TRUE);

                // Will also read it, bit more thematic if Read Magic
                if (nSpellId == SPELL_READ_MAGIC) PlayAnimation(ANIMATION_FIREFORGET_READ);

                // Name the property identified
                if (nSpellId == SPELL_READ_MAGIC)
                {
                    itemproperty ipItemProperty = GetFirstItemProperty(oTarget);
                    while (GetIsItemPropertyValid(ipItemProperty))
                    {
                        if (GetItemPropertyType(ipItemProperty) == ITEM_PROPERTY_CAST_SPELL)
                        {
                            int nSubtype = GetItemPropertySubType(ipItemProperty);
                            int nSpellID = StringToInt(Get2DAString("iprp_spells", "SpellIndex", nSubtype));

                            SendMessageToPC(oCaster, "*You read the magic spell on the scroll: " + GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpellID))) + "*");
                        }
                        ipItemProperty = GetNextItemProperty(oTarget);
                    }
                    return;
                }
                else
                {
                    SendMessageToPC(oCaster, "*You identify the item as: " + GetName(oTarget) + "*");
                }
                return;
            }
        }
    }
    // Failure state
    if (nSpellId == SPELL_READ_MAGIC)
    {
        SendMessageToPCByStrRef(oCaster, STRREF_READ_MAGIC_INVALID_ITEM); // *You must target an unidentified spell scroll or potion.*
    }
    else
    {
        SendMessageToPCByStrRef(oCaster, STRREF_IDENTIFY_INVALID_ITEM); // *You must target an unidentified item.*
    }
}
