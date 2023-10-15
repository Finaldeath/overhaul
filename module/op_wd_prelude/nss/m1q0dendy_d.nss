void main()
{
    if(GetUserDefinedEventNumber() == 1006)
    {
        SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
        SpeakOneLinerConversation();
    }
}
