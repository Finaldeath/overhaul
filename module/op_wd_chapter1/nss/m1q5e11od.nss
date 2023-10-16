void main()
{
    object oDoor1 = GetObjectByTag("M1Q5E11Door1");
    object oDoor2 = GetObjectByTag("M1Q5E11Door2");
    AssignCommand(oDoor1,ActionOpenDoor(oDoor1));
    AssignCommand(oDoor2,ActionOpenDoor(oDoor2));
}
