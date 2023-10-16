void main()
{
    object oExiter = GetExitingObject();
    object oWaypoint = GetWaypointByTag("WP_M2Q1LaranaReturn");

    if (GetTag(oExiter) == "M2Q1ELARANA")
    {
        AssignCommand(oExiter,ClearAllActions());
        AssignCommand(oExiter,ActionForceMoveToObject(oWaypoint));
    }
}
