//::///////////////////////////////////////////////
//:: FileName henchdual
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/10/2002 10:13:57
//:://////////////////////////////////////////////


int MatchSingleHandedWeapon(object oItem)
{
    switch (GetBaseItemType(oItem)) {
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_WARHAMMER: return TRUE;
        break;

        default: break;
     }
     return FALSE;
}
int StartingConditional()
{


    object oHench = GetHenchman(GetPCSpeaker());
    if (MatchSingleHandedWeapon(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oHench)) &&
            MatchSingleHandedWeapon(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oHench)))
            return TRUE;

    return FALSE;
}
