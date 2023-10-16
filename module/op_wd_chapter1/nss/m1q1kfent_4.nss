void main()
{
    object oFenthick = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_oDesther");
    if(IsInConversation(oFenthick) == FALSE)
    {
        ClearAllActions();
        BeginConversation();
    }
    else
    {
        SpeakOneLinerConversation("M1Q1KFent2");
    }
}
