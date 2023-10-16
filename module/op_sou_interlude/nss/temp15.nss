void main()
{
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        AssignCommand(oPC, JumpToObject(OBJECT_SELF));
        oPC = GetNextPC();
    }
}
