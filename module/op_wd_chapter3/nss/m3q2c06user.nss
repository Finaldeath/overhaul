// * When she dies, she 'closes' off the plot by killing the journal entry
void main()
{
    if (GetUserDefinedEventNumber() == 1007)
    {
        AddJournalQuestEntry("M3Q2_A10_ECKEL", 30, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE, TRUE);
    }
}
