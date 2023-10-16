// updates Katriana's information

void main()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1bhalfling");
    if (nPlot == 10)
    {
        AddJournalQuestEntry("q1bhalfling", 16, GetPCSpeaker());
    }
}
