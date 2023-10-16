int StartingConditional()
{
    int iConversationState = GetLocalInt(OBJECT_SELF, "ConversationState");
    if (iConversationState == 0) // 0 = Null State
    {
        return TRUE;
    }
    return FALSE;
}
