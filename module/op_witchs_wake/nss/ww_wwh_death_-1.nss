//::///////////////////////////////////////////////
//:: Witch Wake: WW Handler, Set PC Deathcount to -1
//:: WW_WWH_Death_-1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the deathcount on the Handler's target
     to -1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    SetLocalInt(oTarget, "iDeaths", -1);
}
