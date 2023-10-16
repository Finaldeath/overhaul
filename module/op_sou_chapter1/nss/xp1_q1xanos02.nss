void main()
{
    SetLocalInt(OBJECT_SELF, "Xanos_Spoke", 1);
    //open the multiplayer door
    object oDoor = GetObjectByTag("q2a2_door_playerx");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}
