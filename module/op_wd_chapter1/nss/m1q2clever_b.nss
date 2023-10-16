void main()
{
    int nNth = 1;
    object oDoor = GetNearestObjectByTag("M1Q2CDoor",OBJECT_SELF,nNth);
    while(GetIsObjectValid(oDoor))
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        nNth++;
        oDoor = GetNearestObjectByTag("M1Q2CDoor",OBJECT_SELF,nNth);
    }
}
