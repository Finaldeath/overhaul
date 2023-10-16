int StartingConditional()
{
    int iConversationState = GetLocalInt(OBJECT_SELF, "ConversationState");
    if (iConversationState == 1) // 1 = Assigning Gong Target
    {
        return TRUE;
    }
    return FALSE;
}
