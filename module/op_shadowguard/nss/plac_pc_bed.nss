void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        AssignCommand(oPC, ActionStartConversation(oPC, "sc_inter_end", TRUE, FALSE));
    }
}
