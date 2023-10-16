///////Clears up journal entries that cannot be completed because this character is dead

void main()
{
    SetLocalInt(GetModule(),"NW_G_KLAUTHDEAD",99);
    AddJournalQuestEntry("M3Q04_F02_GORG",99,GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE,TRUE);
    AdjustAlignment(GetLastKiller(),ALIGNMENT_EVIL,5);
}

