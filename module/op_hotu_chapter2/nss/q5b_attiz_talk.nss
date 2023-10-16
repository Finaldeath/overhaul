// Attiz talk trigger

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

    // destroy other talk trigger
    object oTrig = GetNearestObjectByTag("q5b_trig_attiz_talk");
    DestroyObject(oTrig);
    object oAttiz = GetNearestObjectByTag("q5b_attiz");
    AssignCommand(oAttiz, Talk(oPC));

}
