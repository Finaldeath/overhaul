void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ActionStartConversation(OBJECT_SELF, "x2_iw_start"));
}
