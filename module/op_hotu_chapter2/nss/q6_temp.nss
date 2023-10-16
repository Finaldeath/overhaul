void main()
{
    SetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT", 3);
    SetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM", 2);
    object oPC = GetFirstPC();
    CreateItemOnObject("q6_shard", oPC);
    object oWP = GetWaypointByTag("q6f2_wp_sabal_sp");
    object oSabal = CreateObject(OBJECT_TYPE_CREATURE, "q6_sabal", GetLocation(oWP));
        AdjustReputation(oSabal, oPC, 50);
        AdjustReputation(oPC, oSabal, 50);
        SetPlotFlag(oSabal, TRUE);
        // Create the appropriate number of shards on sabal:
        int i = 1;
        for(i = 1; i <= 4; i++)
            CreateItemOnObject("q6_shard", oSabal);

    ExecuteScript("q6f_at_thefool2", GetFirstPC());
}
