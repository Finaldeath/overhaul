// opens, unlocks and highlights the exit door.
void main()
{
    object oDoor = GetNearestObjectByTag("M1Q0A_M1Q0B");
    SetLocked(oDoor,FALSE);
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
}
