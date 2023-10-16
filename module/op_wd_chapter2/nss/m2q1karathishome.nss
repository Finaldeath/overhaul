void main()
{
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered))
    {
        AssignCommand(GetNearestObjectByTag("M2AmbientInfo"),ActionStartConversation(OBJECT_SELF));
    }
}
