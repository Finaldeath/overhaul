//::///////////////////////////////////////////////
//:: Exited
//:: m2q2info_exit2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setara will not leave her space.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    object oWaypoint = GetWaypointByTag("WP_M2Q2SetaraReturn");

    if (GetTag(oExiter) == "M2Q2JSetara")
    {
        AssignCommand(oExiter,ClearAllActions());
        AssignCommand(oExiter,ActionForceMoveToObject(oWaypoint));
    }
}
