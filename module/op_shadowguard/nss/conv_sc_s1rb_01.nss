void main()
{
    object oWP = GetWaypointByTag("WP_ST_1_RC_LAIR_ENT");

    location lWP = GetLocation(oWP);

    object oPC = GetPCSpeaker();

    AssignCommand(oPC, JumpToLocation(lWP));
}
