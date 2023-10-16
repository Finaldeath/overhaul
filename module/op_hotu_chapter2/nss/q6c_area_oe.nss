// Libarary area on-enter

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    object oMedusa = GetObjectByTag("q6_quathala");

    if(oMedusa == OBJECT_INVALID || GetIsDead(oMedusa) || GetLocalInt(oMedusa,"q6_Medusa") == 99)
        return;

    if( /* talked to the medusa */ GetLocalInt(GetModule(), "MedusaTalk") == 0)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KILL_MESUSA_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_KILL_MESUSA_ONCE", 1);

    object oWP = GetWaypointByTag("q6c_wp_medusa_death");
    AssignCommand(oMedusa, ClearAllActions());
    AssignCommand(oMedusa, JumpToObject(oWP));

    SetLocalInt(OBJECT_SELF, "SHARD_TAKEN", 1);
    // if the player enters the area again, then kill jansil and put a few drow bodies

    object oShard = GetItemPossessedBy(oMedusa, "q6_shard");
    DestroyObject(oShard);

    // update the number of shards that Sabal has got:
    int nTotalShards = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    nTotalShards++;
    SetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM", nTotalShards);

    int nSabalNum = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    int nPCNum = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
    if(nSabalNum + nPCNum == 5)
        AddJournalQuestEntry("q6_mainquest", 50, GetFirstPC());

    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(oWP));
    effect eDeath = EffectDeath();
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oMedusa));
}
