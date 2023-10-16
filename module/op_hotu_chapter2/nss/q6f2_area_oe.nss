// Throne room on-enter:
// Spawn Sabal if all the shard parts have been found (and destroy any other instances of her)

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    SetLocalInt(GetModule(), "Q6_NO_DRIDER_WM", 1); // used to change the wandering monster table
    object oWP = GetWaypointByTag("q6f2_wp_sabal_sp");
    int nPlayerShardsNum = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
    int nSabalShardsNum = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");

    if(nPlayerShardsNum + nSabalShardsNum >= 5) // all shards found
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SPAWN_SABAL_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_SPAWN_SABAL_ONCE", 1);

        // destroy old instances of sabal
        object oOldSabal = GetObjectByTag("q6_sabal");
        DestroyObject(oOldSabal);
        oOldSabal = GetObjectByTag("q6_sabal"); // there might be two
        DestroyObject(oOldSabal);
        oOldSabal = GetObjectByTag("q6_sabal1"); // and another possible one
        DestroyObject(oOldSabal);

        object oSabal = CreateObject(OBJECT_TYPE_CREATURE, "q6_sabal", GetLocation(oWP));
        AdjustReputation(oSabal, oPC, 50);
        AdjustReputation(oPC, oSabal, 50);
        SetPlotFlag(oSabal, TRUE);
        // Create the appropriate number of shards on sabal:
        int i = 1;
        for(i = 1; i <= nSabalShardsNum; i++)
            CreateItemOnObject("q6_shard", oSabal);

    }
}
