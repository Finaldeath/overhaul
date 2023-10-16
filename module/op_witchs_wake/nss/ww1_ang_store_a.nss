//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, Open Store
//:: WW1_Ang_Store_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Open Angmar's store for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetObjectByTag("AngmarStore");
    gplotAppraiseOpenStore(oStore, oPC, 74, 24);
}
