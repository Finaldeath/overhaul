void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualInProgress") == FALSE)
    {
        BeginConversation();
    }
}
