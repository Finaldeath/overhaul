void main()
{
    object oEntered = GetEnteringObject();
    object oShrine = GetNearestObjectByTag("M2Q2AShrineTlk");

    if (GetIsPC(oEntered))
    {
        AssignCommand(oShrine,ActionStartConversation(OBJECT_SELF));
    }
}
