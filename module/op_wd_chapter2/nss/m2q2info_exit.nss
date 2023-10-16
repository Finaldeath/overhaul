//::///////////////////////////////////////////////
//:: Exited
//:: m2q2info_exit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The nymph will not leave her space.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    object oWaypoint = GetWaypointByTag("WP_M2Q2NymphReturn");

    if (GetTag(oExiter) == "M2Q2FNymph")
    {
        AssignCommand(oExiter,ClearAllActions());
        AssignCommand(oExiter,ActionForceMoveToObject(oWaypoint));
    }
}
