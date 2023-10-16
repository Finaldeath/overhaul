#include "nw_i0_plot"
void main()
{
    object oSpeaker = GetPCSpeaker();
    SetLocalInt(GetModule(),"NW_G_M1Q01PLOT_BLACKLAKEDISTRICT",TRUE);
    SetCustomToken(100,GetName(oSpeaker));
    SetLocalObject(OBJECT_SELF,"NW_L_oPrimary",oSpeaker);

    DestroyObject(GetItemPossessedBy(oSpeaker,"M1Q3PlotReagent"));

    SetLocalInt(GetModule(),"NW_G_M1Q1MainPlot",GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") + 25);
    int nAmbushPlot = GetLocalInt(GetModule(),"M1_AmbushPlot");
    if(nAmbushPlot >= 20 && nAmbushPlot < 30)
    {
        SetLocalInt(GetModule(),"M1_AmbushPlot",30);
    }
    else if(nAmbushPlot >= 10)
    {
        SetLocalInt(GetModule(),"M1_AmbushPlot",20);
    }
    else if(nAmbushPlot == 0)
    {
        SetLocalInt(GetModule(),"M1_AmbushPlot",10);
    }
// Check the state of the main quest. Update shared journal entry accordingly
    int iJournalState = GetLocalInt(oSpeaker, "NW_JOURNAL_ENTRYm1q1_Main");
    string sJournalTag = "m1q1_Main";
    switch (iJournalState)
    {
        case 0:
        {
            AddJournalQuestEntry(sJournalTag, 20, oSpeaker);
        }
        break;

        case 10:
        {
            AddJournalQuestEntry(sJournalTag, 20, oSpeaker);
        }
        break;

        case 20:
        {
            AddJournalQuestEntry(sJournalTag, 30, oSpeaker);
        }
        break;

        case 30:
        {
            AddJournalQuestEntry(sJournalTag, 40, oSpeaker);
        }
    }
    RewardXP(sJournalTag,25,GetPCSpeaker());
}


