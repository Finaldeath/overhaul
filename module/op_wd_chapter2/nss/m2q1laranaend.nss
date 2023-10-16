void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q1LaranaReturn");

    if (GetDistanceToObject(oWaypoint) > 3.0)
    {
        ActionForceMoveToObject(oWaypoint);
    }
}
