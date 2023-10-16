void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        AssignCommand(GetNearestObjectByTag("M1Q1FNurse01"),SpeakOneLinerConversation("M1Q1KConsole"));
        AssignCommand(GetNearestObjectByTag("M1Q1FNurse01"),ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
    }
}
