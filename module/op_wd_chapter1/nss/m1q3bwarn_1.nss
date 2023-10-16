void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_Fired") == FALSE)
    {
        object oPrisoner = GetNearestObjectByTag("M1Q3APRISON");
        if(GetIsObjectValid(oPrisoner))
            AssignCommand(oPrisoner,SpeakOneLinerConversation());
        SetLocalInt(OBJECT_SELF,"NW_L_Fired",TRUE);
    }
}
