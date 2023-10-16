//::///////////////////////////////////////////////
//:: Name  q7_dist_rechar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Only one item can be placed in the recharger.
    Any new item placed in displaces the old one.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: march 31/03
//:://////////////////////////////////////////////

void main()
{


    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        object oPC = GetLastDisturbed();
        object oItem = GetInventoryDisturbItem();

        //check to see if there is more than one item in the recharger
        object oInv = GetFirstItemInInventory();
        oInv = GetNextItemInInventory();
        //if there is more than one item - get rid of the old one and give it back to the pc
        if (GetIsObjectValid(oInv) == TRUE)
        {
            CopyObject(oInv, GetLocation(OBJECT_SELF), oPC);
            DestroyObject(oInv);
        }
    }
}
