void main()
{
    if(GetUserDefinedEventNumber() == 1001 &&
       Random(3) == 0 &&
       GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 0)
    {
        SpeakOneLinerConversation();
    }
}

