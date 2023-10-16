// A couple of winged elves greet the player

void main()
{
    object oElf1 = GetNearestObjectByTag("q6_WingedElfGreeter1");
    object oElf2 = GetNearestObjectByTag("q6_WingedElfGreeter2");

    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetIsInCombat(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oElf1, ClearAllActions());
    AssignCommand(oElf2, ClearAllActions());

    AssignCommand(oElf1, ActionMoveToObject(oPC, FALSE, 2.0));
    AssignCommand(oElf2, ActionMoveToObject(oPC, FALSE, 2.0));
    AssignCommand(oElf2, ActionStartConversation(oPC, "q6_greeters"));
}
