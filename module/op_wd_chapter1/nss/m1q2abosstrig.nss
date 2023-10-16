void main()
{
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(OBJECT_SELF,"NW_L_FireOnce") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_FireOnce",TRUE);
        AssignCommand(GetNearestObjectByTag("M1Q2GangLeader"),SpeakOneLinerConversation());
    }
}
