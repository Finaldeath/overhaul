void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q1FNurse02"),SpeakOneLinerConversation("M1Q1KConsole"));
        AssignCommand(GetNearestObjectByTag("M1Q1FNurse02"),ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
    }
}
