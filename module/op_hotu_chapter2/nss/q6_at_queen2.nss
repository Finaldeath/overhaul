// close the shaterred mirror quest

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetModule(), "q6_city_gone", 1);
    AddJournalQuestEntry("q6_mainquest", 99, oPC);
    AddJournalQuestEntry("q2_mirror", 99, oPC);
    RemoveJournalQuestEntry("q6_temple", oPC);
    RemoveJournalQuestEntry("q6_wizard", oPC);
    RemoveJournalQuestEntry("q6_merchant", oPC);
    RemoveJournalQuestEntry("q6_shaori", oPC);
    RemoveJournalQuestEntry("q6_library", oPC);

}
