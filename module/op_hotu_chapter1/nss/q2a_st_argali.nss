//::///////////////////////////////////////////////
//:: Open Store
//:: q2a_st_argali
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Open Argali's store
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 24, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oStore = GetObjectByTag("q2a_store_argali");
    gplotAppraiseOpenStore(oStore, GetPCSpeaker());
    //OpenStore(oStore,GetPCSpeaker());
}
