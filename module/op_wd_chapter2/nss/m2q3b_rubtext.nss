void main()
{
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered))
    {
        AssignCommand(GetObjectByTag("M2Q3BRubTlk"),ActionStartConversation(OBJECT_SELF));
    }
}
