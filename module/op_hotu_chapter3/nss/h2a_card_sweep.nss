//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Sweep the Ante (Action Script)
//:: H2a_Card_Sweep.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The NPC empties the contents of the card
     table into his own inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    object oTable = GetObjectByTag("H2_CardTable");
    object oItem = GetFirstItemInInventory(oTable);

    //Parse through all items in the table's inventory
    while (oItem != OBJECT_INVALID)
    {
        //Take the item
        ActionTakeItem(oItem, oTable);

        //Get the next item
        oItem = GetNextItemInInventory(oTable);
    }

    //Gold doesn't count as an item but take it as well.
    int iGold = GetGold(oTable);
    TakeGoldFromCreature(iGold, oTable);

    //Flag the game as no longer active.
    SetLocalInt(GetModule(), "bCardGameActive", FALSE);
}
