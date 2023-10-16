//::///////////////////////////////////////////////
//:: Name q2b_bash_mirror
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Bashing one of the mirrors - no loot drops
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

void main()
{
    //Bashine a mirror destroys its inventory

    object oItem = GetFirstItemInInventory();
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);

        oItem = GetNextItemInInventory();
    }
}
