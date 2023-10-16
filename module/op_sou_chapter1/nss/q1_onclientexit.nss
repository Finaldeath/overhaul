void main()
{
    //open the multiplayer door(just in case player 1 leaves before doing anything)
    if (GetLocalInt(OBJECT_SELF, "nUnlockPlayerXDoor") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nUnlockPlayerXDoor", 1);

        object oDoor = GetObjectByTag("q2a2_door_playerx");
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }
}
