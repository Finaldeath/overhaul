void main()
{
    object oEntered = GetEnteringObject();
    object oAribeth = GetObjectByTag("M2Q1CARIBETH");

    if (GetIsPC(oEntered) &&
        GetLocalInt(oEntered,"NW_L_M2AribethInfo") == 0 &&
        IsInConversation(oAribeth) == FALSE)
    {
        AssignCommand(oEntered,ClearAllActions());
        AssignCommand(oAribeth,ClearAllActions());
        AssignCommand(oAribeth,ActionStartConversation(oEntered));
    }
}
