void main()
{
    object oPC = GetClickingObject();

    if (GetIsPC(oPC))
    {
        AssignCommand(oPC, ActionStartConversation(oPC, "sc_inter_end", TRUE, FALSE));
    }
}
