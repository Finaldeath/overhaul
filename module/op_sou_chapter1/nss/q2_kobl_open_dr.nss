void main()
{
    object oDoor = GetObjectByTag("Q2_KOBOLD_DOOR");

    object oKobold = GetNearestObjectByTag("Q2_KOBOLD_SER");
    SetLocalInt(oKobold, "Q2_PLAYER_WAS_NICE", 1);

    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}
