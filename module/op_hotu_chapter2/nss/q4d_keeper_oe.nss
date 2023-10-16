// Keeper inits dialog with player

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

    object oKeeper = GetNearestObjectByTag("q4d_keeper");
    if(GetLocalInt(GetArea(OBJECT_SELF), "NO_CUTSCENE") == 0)
        AssignCommand(oKeeper, Talk(oPC));

}
