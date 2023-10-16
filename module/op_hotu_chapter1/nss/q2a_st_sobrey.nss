//::///////////////////////////////////////////////
//:: Open Store
//:: q2a_st_sobrey
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open Sobrey's Store
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 25, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oStore = GetNearestObject(OBJECT_TYPE_STORE);
    gplotAppraiseFavOpenStore(oStore, GetPCSpeaker());
    // OpenStore(oStore,GetPCSpeaker());
}
