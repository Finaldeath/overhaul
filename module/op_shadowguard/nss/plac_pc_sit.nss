void main()
{
    object oPC = GetLastUsedBy();
    object oChair = OBJECT_SELF;

    if (GetIsPC(oPC))
        AssignCommand(oPC, ActionSit(oChair));
}
