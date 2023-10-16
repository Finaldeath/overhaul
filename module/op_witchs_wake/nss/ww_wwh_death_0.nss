//::///////////////////////////////////////////////
//:: Witch Wake: WW Handler, Set PC Deathcount to 0
//:: WW_WWH_Death_0.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the deathcount on the Handler's target
     to 0.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    SetLocalInt(oTarget, "iDeaths", 0);
}
