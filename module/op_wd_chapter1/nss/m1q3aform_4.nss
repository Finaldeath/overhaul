void main()
{
    int nMatch = GetListenPatternNumber();
    if (nMatch == -1)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_InConversation",TRUE);
        ClearAllActions();
        BeginConversation();
    }
}
