void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_12"),SpeakOneLinerConversation());
        AssignCommand(GetNearestObjectByTag("M1Q1KNurse1"),SpeakOneLinerConversation("M1Q1KConsole"));
        AssignCommand(GetNearestObjectByTag("M1Q1KNurse1"),ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
    }
}
