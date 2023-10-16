// Talk trigger for Grimgnaw

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

    object oGrim = GetNearestObjectByTag("Grimgnaw");

    DelayCommand(0.5, AssignCommand(oGrim, Talk(oPC)));

}
