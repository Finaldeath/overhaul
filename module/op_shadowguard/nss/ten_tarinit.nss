void main()
{
    object oPC = GetEnteringObject();
    object oTarin = GetNearestObjectByTag("HENCH_TARIN");
    int iDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");

    if ((GetIsPC(oPC) == TRUE) && (GetIsObjectValid(oTarin) == TRUE)
       && (GetArea(oPC) == GetArea(oTarin)) && (iDoOnce == FALSE))
    {
        SetLocalInt(OBJECT_SELF, "DO_ONCE", TRUE);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oTarin, ActionStartConversation(oPC));
    }
}
