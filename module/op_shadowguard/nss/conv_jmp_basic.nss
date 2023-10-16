void main()
{
    object oWP = GetWaypointByTag("");
    location lWP = GetLocation(oWP);

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));
}
