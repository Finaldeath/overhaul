void main()
{
    object oWP = GetWaypointByTag("WP_GH_GH_SEC_PATH_ENT");
    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));
}
