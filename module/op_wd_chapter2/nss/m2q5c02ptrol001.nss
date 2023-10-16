void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q5SURRGOBLIN");

    ActionForceMoveToObject(oWaypoint,FALSE,1.0,4.0);
    ActionDoCommand(SetFacing(GetFacing(oWaypoint)));
}
