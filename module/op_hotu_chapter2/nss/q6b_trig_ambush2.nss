// Init player ambush: the player gets a message that he can ambush the approaching drow.

void SecondFeedback(object oPC)
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "PC_AMBUSH_ACTIVE") == 0)
        return;
    AssignCommand(oPC, SpeakOneLinerConversation("q6_ambush2"));
}

// update journal if player got all the shards
void CheckTotalNum()
{
    int nSabalNum = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    int nPCNum = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
    if(nSabalNum + nPCNum == 5)
        AddJournalQuestEntry("q6_mainquest", 50, GetFirstPC());
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

    float EXIT_DELAY = 60.0;

    // update the number of shards that Sabal has got:
    int nTotalShards = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    nTotalShards++;
    SetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM", nTotalShards);

    CheckTotalNum();

    // the following var is used to exit all the drow from the cave when the player tries to enter
    // the cave rather than wait for them to exit.
    SetLocalInt(GetArea(OBJECT_SELF), "PC_AMBUSH_ACTIVE", 1);
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, SpeakOneLinerConversation("q6_ambush"));
    DelayCommand(EXIT_DELAY - 10.0, SecondFeedback(oPC));

    DelayCommand(EXIT_DELAY, SignalEvent(OBJECT_SELF, EventUserDefined(101)));

}
