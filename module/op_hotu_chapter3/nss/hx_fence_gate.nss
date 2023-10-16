// Fence gate for wolves.
void main()
{
    AssignCommand(GetLastUsedBy(), ClearAllActions(TRUE));
    ActionStartConversation(GetLastUsedBy());
}
