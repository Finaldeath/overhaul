void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        object oDoor = GetObjectByTag("M1Q6F11GuardDoor2");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
    }
}
