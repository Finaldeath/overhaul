void main()
{
    int iCurrent = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYm2q4_Keys");
    if (iCurrent == 20)
    {
        AddJournalQuestEntry("m2q4_Keys", 30, GetPCSpeaker());
    }
    else AddJournalQuestEntry("m2q4_Keys", 25, GetPCSpeaker());
}
