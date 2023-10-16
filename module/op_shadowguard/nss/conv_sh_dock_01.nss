void main()
{
    AssignCommand(OBJECT_SELF, SetFacing(GetFacing(OBJECT_SELF)));

    object oDoor = GetNearestObjectByTag("PT_ACAD_DOCK_DOOR");

    SetLocked(oDoor, FALSE);

    AssignCommand(oDoor, ActionOpenDoor(oDoor));
}
