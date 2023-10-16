//::///////////////////////////////////////////////
//:: Open Store
//:: q2a_st_white
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open White's Store
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 25, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{

    //object oStore = GetNearestObject(OBJECT_TYPE_STORE);
    object oStore = GetObjectByTag("X2_STOREQ2AWHITE");
    gplotAppraiseFavOpenStore(oStore, GetPCSpeaker());
    //OpenStore(oStore,GetPCSpeaker());
}
