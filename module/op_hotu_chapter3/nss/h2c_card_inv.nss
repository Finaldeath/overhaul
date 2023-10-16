//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Open Inventory (Condition Script)
//:: H2c_Card_10000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Always returns TRUE but will also open the
     Card Table's inventory for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oTable = GetObjectByTag("H2_CardTable");
    object oPC = GetPCSpeaker();
    OpenInventory(oTable, oPC);
    return TRUE;
}
