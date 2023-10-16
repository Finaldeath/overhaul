void main()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYc2_Aarin");
    SetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter",-1);
    if ((iPlot > 0) && (iPlot < 50))
    {
        AddJournalQuestEntry("c2_Aarin", 50, GetPCSpeaker(), FALSE);
    }
}
