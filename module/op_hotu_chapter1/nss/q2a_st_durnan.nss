//::///////////////////////////////////////////////
//:: Open Store
//:: q2a_st_durnan
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open Durnan's Store
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 21/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oStore = GetObjectByTag("store_q2adurnan");
    gplotAppraiseOpenStore(oStore, GetPCSpeaker());
    //OpenStore(oStore,GetPCSpeaker());
}
