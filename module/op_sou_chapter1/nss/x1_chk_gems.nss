//::///////////////////////////////////////////////
//:: Name x1_chk_gems
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Check to see if the PC has any gems on him
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nFound = FALSE;
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID && nFound == FALSE)
    {
        if (GetBaseItemType(oItem) == BASE_ITEM_GEM)
            nFound = TRUE;

        oItem = GetNextItemInInventory(oPC);
    }
    if (nFound == TRUE)
        return TRUE;
    return FALSE;
}
