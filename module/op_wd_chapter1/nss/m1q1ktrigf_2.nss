void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_09"),SpeakOneLinerConversation());
        AssignCommand(GetNearestObjectByTag("M1Q6KPatient_10"),SpeakOneLinerConversation());
    }
}
