void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_A_SeedyTavern") < 10)
    {
        object oDoor = GetObjectByTag("M1Q4A_M1Q4F");
        AssignCommand(oDoor,ActionCloseDoor(oDoor));
    }
}
