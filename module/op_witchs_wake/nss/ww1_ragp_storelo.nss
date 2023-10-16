//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Store Low
//:: WW1_Ragp_StoreLo.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Open the Ragpicker's Store with good prices,
     thereby giving the player a better deal.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:October 4, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetObjectByTag("RagpickersStore");

    gplotAppraiseOpenStore(oStore, oPC, 49, 49);
}
