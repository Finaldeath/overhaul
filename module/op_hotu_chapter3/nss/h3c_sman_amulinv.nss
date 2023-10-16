//::///////////////////////////////////////////////
//:: Sleeping Man, PC Amulet in Inventory (Condition Script)
//:: H3c_SMan_AmulInv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has the Sensei's
     amulet in their inventory but doesn't have
     it equipped.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oAmulet = GetItemPossessedBy(oPC, "H2_SenseiAmulet");
    object oNeckSlot = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
    if (oAmulet != OBJECT_INVALID &&
        oAmulet != oNeckSlot)
    {
        return TRUE;
    }
    return FALSE;
}
