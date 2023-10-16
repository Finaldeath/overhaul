void main()
{
    object oEntered = GetEnteringObject();
    object oGuard = GetObjectByTag("2Q6_ShieldGuard2");

    if (GetIsPC(oEntered) || oEntered == oGuard)
    {
        AssignCommand(oGuard,SpeakOneLinerConversation());
    }
}
