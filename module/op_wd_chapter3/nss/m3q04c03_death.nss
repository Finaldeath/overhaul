///////Clears up journal entries that cannot be completed because this character is dead

void main()
{
    SetIsDestroyable(FALSE,FALSE,FALSE);
    if (GetLocalInt(OBJECT_SELF,"NW_G_AKULPLOT")==1)
    {
        AddJournalQuestEntry("M3Q04_C03_AKUL",99,GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE,TRUE);
    }
}
