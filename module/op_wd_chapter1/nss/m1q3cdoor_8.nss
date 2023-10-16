void main()
{
    object oDoor = GetNearestObjectByTag("M1Q3COuterDoor",OBJECT_SELF,1);
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
    oDoor = GetNearestObjectByTag("M1Q3COuterDoor",OBJECT_SELF,2);
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
}
