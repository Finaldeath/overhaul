void main()
{
    object oDoor = GetNearestObjectByTag("M1Q4IDaraDoor");
    if(GetIsOpen(oDoor))
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Opened",TRUE);
    }
    else
    {
        if (Random(3) == 0 &&
            GetLocalInt(OBJECT_SELF,"NW_L_Opened") == FALSE)
        {
            SpeakOneLinerConversation();
        }
    }
}
