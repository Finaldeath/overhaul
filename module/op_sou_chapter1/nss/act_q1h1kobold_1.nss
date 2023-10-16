//::///////////////////////////////////////////////
//:: Name act_q1h1kobold_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take gem from the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oKobold = GetObjectByTag("q1h2_kblake");
    int nFound = FALSE;
    object oPC = GetPCSpeaker();
    object oGem;
    object oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID && nFound == FALSE)
    {
        if (GetBaseItemType(oItem) == BASE_ITEM_GEM)
        {
            nFound = TRUE;
            oGem = oItem;
        }
        oItem = GetNextItemInInventory(oPC);
    }
    object oNewGem = CreateItemOnObject(GetResRef(oGem), oKobold, 1);
    SetDroppableFlag(oNewGem, TRUE);
    int nStack = GetNumStackedItems(oGem);
    if (nStack > 1)
        SetItemStackSize(oGem, nStack - 1);
    else
    {
        DestroyObject(oGem);
    }
        //AssignCommand(oKobold, ActionTakeItem(oGem, GetPCSpeaker()));


}
