void main()
{
    object oEntered = GetEnteringObject();
    object oInfo = GetObjectByTag("M2Q1ELARANA");

    if (GetIsPC(oEntered) &&
        GetLocalInt(oEntered,"NW_L_M2LaranaInfo") == 0 &&
        IsInConversation(oInfo) == FALSE)
    {
        AssignCommand(oEntered,ClearAllActions());
        AssignCommand(oInfo,ClearAllActions());
        AssignCommand(oInfo,ActionStartConversation(oEntered));
    }
}
