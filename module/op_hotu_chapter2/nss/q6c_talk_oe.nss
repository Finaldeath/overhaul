// Guard talk trigger

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oGuard = GetNearestObjectByTag("q6_ulithar");
    if(oGuard == OBJECT_INVALID || GetIsDead(oGuard))
        return;

    AssignCommand(oGuard, Talk(oPC));
}
