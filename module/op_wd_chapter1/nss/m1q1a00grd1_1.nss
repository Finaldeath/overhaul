void main()
{
    int nTimer = GetLocalInt(OBJECT_SELF,"NW_L_M1Q1A00GrdTimer");
    if(nTimer >= 3)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q1A00GrdTimer",0);
        if(IsInConversation(OBJECT_SELF) == FALSE)
        {
            ActionStartConversation(OBJECT_SELF);
        }
    }
    else
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q1A00GrdTimer",nTimer + 1);

    }
}
