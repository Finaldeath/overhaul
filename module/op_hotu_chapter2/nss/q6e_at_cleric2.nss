// Player accepted cleric's challenge.
// Chains should be usable for next round.

void main()
{
    SetLocalInt(OBJECT_SELF, "STATUS", 1);
    AddJournalQuestEntry("q6_temple",10,GetPCSpeaker());
}
