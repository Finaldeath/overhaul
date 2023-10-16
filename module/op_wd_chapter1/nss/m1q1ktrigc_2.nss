void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_07"),SpeakOneLinerConversation());
        AssignCommand(GetNearestObjectByTag("M1Q1KNurse"),SpeakOneLinerConversation("M1Q1KConsole"));
        AssignCommand(GetNearestObjectByTag("M1Q1KNurse"),ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
    }
}
