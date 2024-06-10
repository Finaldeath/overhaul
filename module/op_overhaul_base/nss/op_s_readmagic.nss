//::///////////////////////////////////////////////
//:: Read Magic
//:: op_s_readmagic.nss
//:://////////////////////////////////////////////
/*
    You identify a spell scroll or potions contents.
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
    // magic of the first unidentified scroll in their inventory.

    if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        int nBaseItemType = GetBaseItemType(oTarget);
        if (nBaseItemType == BASE_ITEM_BLANK_SCROLL ||
            nBaseItemType == BASE_ITEM_ENCHANTED_SCROLL ||
            nBaseItemType == BASE_ITEM_SCROLL ||
            nBaseItemType == BASE_ITEM_SPELLSCROLL ||
            nBaseItemType == BASE_ITEM_BLANK_POTION ||
            nBaseItemType == BASE_ITEM_ENCHANTED_POTION||
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

                // Will also read it, bit more thematic
                PlayAnimation(ANIMATION_FIREFORGET_READ);

                // Name the property identified
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
        }
    }
    // Failure state
    SendMessageToPC(oCaster, "*You must target an unidentified spell scroll or potion.*");
}
