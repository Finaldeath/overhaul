//::///////////////////////////////////////////////
//:: Name con_q5tymo_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if the chest has 0 gp worth of inventory in it
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: mar 24/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nValue = 0;
    object oItem;
    object oChest = GetObjectByTag("q5dragonchest");
    oItem = GetFirstItemInInventory(oChest);
    while (oItem != OBJECT_INVALID)
    {
        nValue = nValue + GetGoldPieceValue(oItem);
        oItem = GetNextItemInInventory(oChest);
    }
    if (nValue == 0)
        return TRUE;
    return FALSE;
}
