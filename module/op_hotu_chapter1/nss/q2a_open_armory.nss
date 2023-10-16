//Add Armory journal entry
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    object oPC = GetLastOpenedBy();
    AddJournalQuestEntry("q2aArmory", 99, oPC);
}
