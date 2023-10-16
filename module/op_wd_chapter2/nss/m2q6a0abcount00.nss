void main()
{
    int iPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYc2_Aribeth");
    SetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter",-1);
    if ((iPlot > 0) && (iPlot < 50))
    {
        AddJournalQuestEntry("c2_Aribeth", 50, GetPCSpeaker(), FALSE);
    }
}
