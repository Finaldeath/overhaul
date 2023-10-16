void main()
{
    object oPC = GetPCSpeaker();
    int iNewsState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_NEWS");
    int iJemState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_3a");
    /*
    if (iNewsState > 25)
    {
        AddJournalQuestEntry("M1Q5_NEWS", 25, oPC, TRUE, TRUE);
    }
    */
    if (iJemState > 1 && iJemState < 20)
    {
        AddJournalQuestEntry("M1Q5_Begg_3a", 20, oPC);
    }

    if(GetLocalInt(GetModule(),"NW_G_M1Q5PlotCult") < 10)
    {
        SetLocalInt(GetModule(),"NW_G_M1Q5PlotCult", 10);
    }
    SetLocalInt(GetModule(),"NW_G_M1Q5JemanieSpokenToXXX", 10);
}
