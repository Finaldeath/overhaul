//Jump Lyen to his waypoint, just in case he hasn't made it there yet.

void main()
{
    object oLyen = GetNearestObjectByTag("HENCH_LYEN");
    object oWP = GetWaypointByTag("WP_CS_JHORDAK_LYEN");
    AssignCommand(oLyen, ClearAllActions(TRUE));
    AssignCommand(oLyen, JumpToObject(oWP));
}
