// area-transition down the hole at the gnoll caves

void main()
{
    object oPC = GetPCSpeaker();
    object oTarget = GetWaypointByTag("Q3B_WP_ARRIVE");
    location lLoc = GetLocation(oTarget);

    AssignCommand(oPC,JumpToLocation(lLoc));
}
