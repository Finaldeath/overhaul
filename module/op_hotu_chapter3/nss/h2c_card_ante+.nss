//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick Ante Too High (Condition Script)
//:: H2c_Card_Ante+.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the ante items on the card
     table have a combined value of over 10,000
     gp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oTable = GetNearestObjectByTag("H2_CardTable");
    object oItem = GetFirstItemInInventory(oTable);
    int iTotalValue = 0;
    int iItemValue;

    while (oItem != OBJECT_INVALID)
    {
        //Add this item's value to the total count.
        iItemValue = GetGoldPieceValue(oItem);
        iTotalValue = iTotalValue + iItemValue;

        //Look for the next item.
        oItem = GetNextItemInInventory(oTable);
    }

    //Gold doesn't count as an item but count it as well.
    int iGold = GetGold(oTable);
    iTotalValue = iTotalValue + iGold;

    if (iTotalValue > 10000)
    {
        return TRUE;
    }
    return FALSE;
}
