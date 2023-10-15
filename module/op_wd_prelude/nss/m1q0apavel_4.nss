void main()
{
    if(GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 1)
    {
        SetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL",2);
        SetLocalInt(OBJECT_SELF, "NW_L_CallingOut",TRUE);
        AssignCommand(GetLastAttacker(),ClearAllActions());
        SpeakOneLinerConversation();
    }
}

