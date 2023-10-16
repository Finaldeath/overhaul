//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, Player Wearing King's Armor
//:: WW1_Helga_Armor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is still wearing
     King's Armor.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 24, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oArmor = GetItemPossessedBy(oPC, "KingsArmor");


    if (oArmor != OBJECT_INVALID &&
        oArmor == GetItemInSlot(INVENTORY_SLOT_CHEST, oPC))
    {
        return TRUE;
    }
    return FALSE;
}
