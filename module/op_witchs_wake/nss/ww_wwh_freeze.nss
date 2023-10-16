//::///////////////////////////////////////////////
//:: Witch Wake 1: WW Handler, Freeze Target
//:: WW_WWH_Freeze.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Freezes the Handler's target.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    SetCommandable(FALSE, oTarget);
}
