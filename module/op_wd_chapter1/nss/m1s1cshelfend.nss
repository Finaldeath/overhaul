void main()
{
    object oPC = GetPCSpeaker();
    object oWayPoint = GetWaypointByTag("WP_M1S1C_M1S1D");
    location lLoc = GetLocation(oWayPoint);
    
    AssignCommand(oPC,JumpToLocation(lLoc));
}
