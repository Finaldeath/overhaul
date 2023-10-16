//::///////////////////////////////////////////////
//:: FinishPlot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:John Winski
//:: Created On: June 17, 2002
//:://////////////////////////////////////////////
void Jump(object oWaypoint)
{
    ClearAllActions();
    JumpToObject(oWaypoint);
}


void main()
{
    object oPC = GetLastUsedBy();
    object oWaypoint1 = GetWaypointByTag("WP_End1");

    AssignCommand(oPC,Jump(oWaypoint1));
}
