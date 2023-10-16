//::///////////////////////////////////////////////
//:: Sleeping Man, PC Amulet Equipped (Condition Script)
//:: H3c_SMan_AmulEqu.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has the Sensei's
     amulet equipped.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oAmulet = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
    string sTag = GetTag(oAmulet);
    if (sTag == "H2_SenseiAmulet")
    {
        return TRUE;
    }
    return FALSE;
}
