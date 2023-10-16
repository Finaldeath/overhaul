//::///////////////////////////////////////////////
//:: Witch Wake 1: Theft Handling System
//:: WW1_Theft.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Any paladin stealing from this container will
     fall.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetLastDisturbed();
    int iDisturbType = GetInventoryDisturbType();

    if (iDisturbType == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        PaladinFalls(oPC);
    }
}
