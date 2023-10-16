//::///////////////////////////////////////////////
//:: Name con_q5tymo_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if the chest has 2000 gp worth of inventory in it (or more)
    if so, destroy the chest immediately
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
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
    if (nValue >= 2000)
        return TRUE;
    return FALSE;
}
