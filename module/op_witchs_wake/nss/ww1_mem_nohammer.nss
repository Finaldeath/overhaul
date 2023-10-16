//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, No Hammer
//:: WW1_Mem_NoHammer.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if you have the chisel required
     to carve the memorial but you don't have a
     hammer.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
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

    //If chisel is valid but hammer is not, return TRUE
    if (oChisel != OBJECT_INVALID &&
        iBaseType == BASE_ITEM_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
