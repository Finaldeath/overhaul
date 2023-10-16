#include "nw_i0_plot"

void main()
{
    object oSpeaker = GetPCSpeaker();
    SetLocalInt(GetModule(),"NW_G_M1Q01PLOT_BEGGARSNEST",TRUE);
    SetCustomToken(100,GetName(oSpeaker));
    SetLocalObject(OBJECT_SELF,"NW_L_oPrimary",oSpeaker);
    SetLocalObject(GetModule(),"NW_G_M1Q5Returnee",oSpeaker);

    DestroyObject(GetItemPossessedBy(oSpeaker,"M1Q5PlotReagent"));

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

// Check state of M1Q1_Begg_1 journal and update to give direction to
// Harben if player has not already recieved a reward from him
    if (GetLocalInt(oSpeaker, "NW_JOURNAL_ENTRYM1Q1_Begg_1") < 60)
    {
        AddJournalQuestEntry("M1Q1_Begg_1", 70, oSpeaker);
    }
    else if (GetLocalInt(oSpeaker, "NW_JOURNAL_ENTRYM1Q1_Begg_1") == 60)
    {
        AddJournalQuestEntry("M1Q1_Begg_1", 80, oSpeaker);
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

