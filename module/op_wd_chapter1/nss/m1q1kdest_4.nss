void main()
{
    object oFenthick = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_oFenthick");
    if(IsInConversation(oFenthick) == FALSE)
    {
        ClearAllActions();
        BeginConversation();
    }
    else
    {
        SpeakOneLinerConversation("M1Q1KDest2");
    }
}
