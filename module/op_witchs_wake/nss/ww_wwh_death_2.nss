//::///////////////////////////////////////////////
//:: Witch Wake: WW Handler, Set PC Deathcount to 2
//:: WW_WWH_Death_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the deathcount on the Handler's target
     to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    SetLocalInt(oTarget, "iDeaths", 2);
}
