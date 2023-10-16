void main()
{
    object oBat = GetEnteringObject();
    if(GetTag(oBat) != "NW_BAT")
        return;
    object oWP = GetWaypointByTag("Q2_WP_BATS");
    AssignCommand(oBat, ClearAllActions());
    AssignCommand(oBat, JumpToObject(oWP));

}
