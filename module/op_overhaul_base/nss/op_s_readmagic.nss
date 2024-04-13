//::///////////////////////////////////////////////
//:: Read Magic
//:: op_s_readmagic.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Bard 0, Cleric 0, Druid 0, Paladin 1, Ranger 1, Wizard / Sorcerer 0
    Innate Level: 0
    School: General
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Personal
    Area of Effect / Target: Single Scroll
    Duration: Instant
    Additional Counter Spells:
    Save: None
    Spell Resistance: No

    You identify a spell scrolls contents.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        int nBaseItemType = GetBaseItemType(oTarget);
        if (nBaseItemType == BASE_ITEM_BLANK_SCROLL ||
            nBaseItemType == BASE_ITEM_ENCHANTED_SCROLL ||
            nBaseItemType == BASE_ITEM_SCROLL ||
            nBaseItemType == BASE_ITEM_SPELLSCROLL)
        {
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
    SendMessageToPC(oCaster, "*You must target an unidentified spell scroll to read magic*");
}

