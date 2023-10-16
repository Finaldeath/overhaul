////// Set Local Int to indicate player has spoken with Lord Nasher
///////  Player cannot pass through the door until Lord Nasher has been spoken to

void main()
{
    SetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALKNASHER",1);
    AssignCommand(GetNearestObjectByTag("M4A04CastleDoor1"), ActionOpenDoor(GetNearestObjectByTag("M4A04CastleDoor1")));
//    AssignCommand(GetNearestObjectByTag("M4A04CastleDoor2"), ActionOpenDoor(GetNearestObjectByTag("M4A04CastleDoor2")));
    AssignCommand(GetNearestObjectByTag("M4A04CastleDoor3"), ActionOpenDoor(GetNearestObjectByTag("M4A04CastleDoor3")));
    SetLocked(GetNearestObjectByTag("M4A04CastleDoor1"), FALSE);
//    SetLocked(GetNearestObjectByTag("M4A04CastleDoor2"), FALSE);
    SetLocked(GetNearestObjectByTag("M4Q1Castle_Dun"), FALSE);
}
