void main()
{
    object oPC = GetPCSpeaker();

    object oDoor = GetNearestObjectByTag("DOOR_010_1_1", oPC);

    SetLocked(oDoor, FALSE);

    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}
