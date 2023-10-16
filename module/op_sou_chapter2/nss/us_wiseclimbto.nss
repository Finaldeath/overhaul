//::///////////////////////////////////////////////
//:: Wise Wind Ladder Climb (OnUse)
//:: Us_WiseClimbTo.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to the ClimbTo point.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    object oClimbTo = GetNearestObjectByTag("WiseWindClimbTo");
    object oPC = GetLastUsedBy();

    AssignCommand(oPC, JumpToObject(oClimbTo));
}
