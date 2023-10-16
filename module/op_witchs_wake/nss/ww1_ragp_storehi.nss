//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Store High
//:: WW1_Ragp_StoreHi.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Open the Ragpicker's Store with poor prices,
     thereby penalizing players who were unable
     to Intimidate her or Obtain a Favor.
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

    gplotAppraiseOpenStore(oStore, oPC, 74, 24);
}
