void main()
{
    object oDoor = GetNearestObjectByTag("M1Q5F11Door1");
    if(GetLocked(oDoor) == FALSE)
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
    oDoor = GetNearestObjectByTag("M1Q5F11Door2");
    if(GetLocked(oDoor) == FALSE)
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
}
