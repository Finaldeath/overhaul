void main()
{
    object oJournalRecip = GetLastKiller();
    object oMaster = GetMaster(oJournalRecip);
    if(GetIsObjectValid(oMaster))
    {
        oJournalRecip = oMaster;
    }
    if(GetIsPC(oJournalRecip) &&
       GetLocalInt(oJournalRecip,"NW_JOURNAL_ENTRYM1Q5_Aldo") >= 10 )
    {
        AddJournalQuestEntry("M1Q5_Aldo", 60, oJournalRecip);
    }
}
