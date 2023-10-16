///////Clears up journal entries that cannot be completed because this character is dead

void main()
{
AddJournalQuestEntry("NW_LUCE_LEESA",99,GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE,TRUE);
}

