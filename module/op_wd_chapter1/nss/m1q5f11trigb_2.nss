void main()
{
    object oDoor = GetNearestObjectByTag("M1Q5F11Door3");
    if(GetLocked(oDoor) == FALSE)
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
    oDoor = GetNearestObjectByTag("M1Q5F11Door4");
    if(GetLocked(oDoor) == FALSE)
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
}
