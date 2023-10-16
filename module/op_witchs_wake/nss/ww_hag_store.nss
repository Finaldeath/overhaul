//::///////////////////////////////////////////////
//:: Witchwork: Open Night Hag's Store
//:: WW_Hag_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Opens the Night Hag's store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetObjectByTag("HagStore");
    gplotAppraiseOpenStore(oStore, oPC, 49, 49);
}
