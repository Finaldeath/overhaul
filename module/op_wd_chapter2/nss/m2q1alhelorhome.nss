void main()
{
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered) && GetLocalInt(GetModule(),"M2Q1AlhelorHome") == 0)
    {
        AssignCommand(GetNearestObjectByTag("M2AmbientInfo"),ActionStartConversation(OBJECT_SELF));
    }
}
