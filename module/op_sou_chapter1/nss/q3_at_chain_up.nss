// area-transition down the hole at the gnoll caves

void main()
{
    object oPC = GetPCSpeaker();
    object oTarget = GetWaypointByTag("Q3A_WP_RETURN");
    location lLoc = GetLocation(oTarget);

    AssignCommand(oPC,JumpToLocation(lLoc));
}
