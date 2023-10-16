void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(OBJECT_SELF,"NW_L_FireOnce") == FALSE)
    {
        object oBoss = GetNearestObjectByTag("M1Q2BossMage");
        SetLocalInt(OBJECT_SELF,"NW_L_FireOnce",TRUE);
        AssignCommand(oBoss,SpeakOneLinerConversation());
    }
}
