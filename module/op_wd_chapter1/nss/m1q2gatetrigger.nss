void main()
{
    object oEnter = GetEnteringObject();
    if(GetIsPC(oEnter) &&
       GetLocalInt(oEnter,"NW_L_m1q2AKipp_Spoken") == FALSE)
    {
        AssignCommand(GetNearestObjectByTag("m1q2AKipp"),SpeakOneLinerConversation());
    }

}
