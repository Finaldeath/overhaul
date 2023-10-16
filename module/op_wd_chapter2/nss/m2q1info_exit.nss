void main()
{
    object oExiter = GetExitingObject();
    object oWaypoint = GetWaypointByTag("WP_M2Q1AribethReturn");

    if (GetTag(oExiter) == "M2Q1CARIBETH")
    {
        AssignCommand(oExiter,ClearAllActions());
        AssignCommand(oExiter,ActionForceMoveToObject(oWaypoint));
    }
}
