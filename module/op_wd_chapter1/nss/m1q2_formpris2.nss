int StartingConditional()
{
    int iConversationState = GetLocalInt(OBJECT_SELF, "ConversationState");
    if (iConversationState == 2) // 2 = Responding to Gong
    {
        return TRUE;
    }
    return FALSE;
}
