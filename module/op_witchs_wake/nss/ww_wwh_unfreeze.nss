//::///////////////////////////////////////////////
//:: Witch Wake 1: WW Handler, UnFreeze Target
//:: WW_WWH_Unfreeze.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Unfreezes the Handler's target.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    SetCommandable(TRUE, oTarget);
}
