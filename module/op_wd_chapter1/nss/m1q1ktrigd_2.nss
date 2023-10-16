void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_03"),SpeakOneLinerConversation());
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_04"),SpeakOneLinerConversation());
    }
}
