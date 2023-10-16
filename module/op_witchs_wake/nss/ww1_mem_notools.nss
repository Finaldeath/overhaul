//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, No Tools
//:: WW1_Mem_NoTools.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if you don't have the hammer
     and chisel required to carve the memorial.
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
    object oHammer = GetFirstItemInInventory(oPC);
    int iBaseType = GetBaseItemType(oHammer);
    while (iBaseType != BASE_ITEM_LIGHTHAMMER &&
           iBaseType != BASE_ITEM_WARHAMMER &&
           iBaseType != BASE_ITEM_INVALID)
    {
        oHammer = GetNextItemInInventory(oPC);
        iBaseType = GetBaseItemType(oHammer);
    }

    //If neither are valid, return TRUE
    if (oChisel == OBJECT_INVALID &&
        iBaseType == BASE_ITEM_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
