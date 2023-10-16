void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_05"),SpeakOneLinerConversation());
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_06"),SpeakOneLinerConversation());
    }
}
