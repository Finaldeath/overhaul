void main()
{
    //* Send Player into the house
    object oPC = GetPCSpeaker();
    location lPlayerSpawn = GetLocation(GetWaypointByTag("WP_M2Q2HPlayerSpawn"));
    
    AssignCommand(oPC,ActionJumpToLocation(lPlayerSpawn));
    DestroyObject(OBJECT_SELF);
}
