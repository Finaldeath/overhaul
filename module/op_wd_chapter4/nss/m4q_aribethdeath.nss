///////Clears up journal entries that cannot be completed because this character is dead

void main()
{

    SetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_KILLED", 1);
    AddJournalQuestEntry("M4Q01Aribeth",99,GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE,TRUE);
    // * stop her custom music
    ExecuteScript("m4aribethsndstop", OBJECT_SELF);

}

