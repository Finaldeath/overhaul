void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_InConversation") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_InConversation",TRUE);
        BeginConversation();
    }
}
