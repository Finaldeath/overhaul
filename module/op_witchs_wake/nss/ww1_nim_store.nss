//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Open Store
//:: WW1_Nim_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Opens Nimmermaer's Store, with the prices
     determined by the player's skill check.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    object oStore = GetObjectByTag("NimmermaersStore");

    //If skill check was successful, open a store with good prices.
    if (sResult == "Success")
    {
        gplotAppraiseOpenStore(oStore, oPC, 49, 49);
    }

    //If skill check was unsuccessful or not attempted, open a store with bad prices.
    else
    {
        gplotAppraiseOpenStore(oStore, oPC, 74, 24);
    }
}
