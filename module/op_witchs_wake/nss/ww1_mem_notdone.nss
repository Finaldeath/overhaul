//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Incomplete
//:: WW1_Mem_NotDone.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the memorial is incomplete
     and the player is carrying the proper tools
     to continue it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18. 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iEndComplete = GetLocalInt(OBJECT_SELF, "iEndComplete");
    object oPC = GetPCSpeaker();
    object oChisel = GetItemPossessedBy(oPC, "ww1_chisel");

    //Run a loop to find any hammer.
    object oHammer = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int iBaseType = GetBaseItemType(oHammer);
    if (iBaseType != BASE_ITEM_LIGHTHAMMER &&
        iBaseType != BASE_ITEM_WARHAMMER)
    {
        oHammer = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
        iBaseType = GetBaseItemType(oHammer);
        if (iBaseType != BASE_ITEM_LIGHTHAMMER &&
            iBaseType != BASE_ITEM_WARHAMMER)
        {
            oHammer = GetFirstItemInInventory(oPC);
            iBaseType = GetBaseItemType(oHammer);
            while (iBaseType != BASE_ITEM_LIGHTHAMMER &&
                   iBaseType != BASE_ITEM_WARHAMMER &&
                   iBaseType != BASE_ITEM_INVALID)
            {
                oHammer = GetNextItemInInventory(oPC);
                iBaseType = GetBaseItemType(oHammer);
            }
        }
    }

    //If both are valid, return TRUE
    if (oChisel != OBJECT_INVALID &&
        iBaseType != BASE_ITEM_INVALID &&
        iEndComplete == 0)
    {
        return TRUE;
    }
    return FALSE;
}
