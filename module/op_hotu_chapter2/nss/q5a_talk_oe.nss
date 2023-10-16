// Drow warrior speaks topc

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

    object oDrow = GetNearestObjectByTag("q5a_eldath");

    effect eEff = GetFirstEffect(oDrow);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oDrow, eEff);
        eEff = GetNextEffect(oDrow);
    }

    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oDrow, Talk(oPC));

}
