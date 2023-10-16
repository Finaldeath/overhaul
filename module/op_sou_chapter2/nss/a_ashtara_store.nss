//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Action - Open Store)
//:: A_Ashtara_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Allow the player to view Ashtara's store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 25, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetNearestObjectByTag("AshtaraStore");
    gplotAppraiseOpenStore(oStore, oPC);
 }
