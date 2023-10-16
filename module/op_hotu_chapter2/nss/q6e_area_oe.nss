// Shaori's Fell Tempe area on-enter

// Need to update the cleric's status if the player is returning without completing the challenge
void CheckClericStatus()
{
    object oCleric = GetNearestObjectByTag("q6_priest");
    int nStatus = GetLocalInt(OBJECT_SELF, "STATUS");
    if(nStatus == 1 || nStatus == 2 || nStatus == 3 || nStatus == 6)
    {
        object oShard = GetItemPossessedBy(oCleric, "q6_shard");
        DestroyObject(oShard);
        // update the number of shards that Sabal has got:
        int nTotalShards = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
        nTotalShards++;
        SetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM", nTotalShards);
        SetLocalInt(oCleric, "STATUS", 4);
        int nSabalNum = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
        int nPCNum = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
        if(nSabalNum + nPCNum == 5)
            AddJournalQuestEntry("q6_mainquest", 50, GetFirstPC());
    }
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    CheckClericStatus();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    effect eVis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "q6e_blocker")
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObject);
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }

}
