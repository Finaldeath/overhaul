void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 500:
            ClearAllActions();
            SetLocalInt(OBJECT_SELF,"NW_L_Torture",1);
            SpeakOneLinerConversation();
        break;
    }
}
