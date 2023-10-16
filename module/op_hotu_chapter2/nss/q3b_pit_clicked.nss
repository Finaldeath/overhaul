void main()
{
    AssignCommand(GetLastUsedBy(), ClearAllActions(TRUE));
    ActionStartConversation(GetLastUsedBy(), "q3b_pit");
}
