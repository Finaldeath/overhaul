
#include "x2c2_inc_plot"
#include "nw_i0_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 4554)
    {
        object oItem = GetLocalObject(OBJECT_SELF, "X2_ITEM_ACQUIRED");
        object oPC = GetLocalObject(OBJECT_SELF, "X2_ITEM_ACQUIRED_BY");

        if(!GetIsPC(oPC))
                return;

        if(GetTag(oItem) == "q5_StoneSlab")
        {
            if(GetPlot("q5_journal_beholders") == 1)
                SetPlot("q5_journal_beholders", 10);
        }

        if(GetTag(oItem) == "q6_shard") // Shattered mirror shard
            {
                if(GetLocalInt(oItem, "ACQUIRED") == 1) // do once for each shard
                    return;

                string sAreaTag = GetTag(GetArea(oPC));
                if(sAreaTag == "q6_Library")
                    SetPlot("q6_library", 99);
                else if(sAreaTag == "q6e_ShaorisFellTemple")
                    SetPlot("q6_temple", 99);
                else if(sAreaTag == "q6d_wizard_tower3")
                    SetPlot("q6_wizard", 99);
                else if(sAreaTag == "q6_NorthernCavern")
                {
                    SetLocalInt(GetArea(oPC), "COMPASS_ACTIVE", 0);
                    SetPlot("q6_merchant", 99);
                }

                SetLocalInt(oItem, "ACQUIRED", 1);
                SetItemCursedFlag(oItem, TRUE);
                // Update shards count
                int nCount = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
                nCount++;
                SetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT", nCount);
                Reward_2daXP(GetFirstPC(), 41); // every shard worth 1000 xp

                int nSabalNum = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
                int nPCNum = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
                if(nSabalNum + nPCNum == 5)
                    AddJournalQuestEntry("q6_mainquest", 50, GetFirstPC());

        }

    }

}
