//:://////////////////////////////////////////////
/*
    Updates and closes the Find Jemanie quest log
    when Jemanie dies. Finds the nearest player
    charatcer and gives him the journal entry only
    if he is on the plot to find Jemanie in the
    first place.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Dec 15, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
    int iJemanieState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_3a");

    if (iJemanieState > 1)
        {
            AddJournalQuestEntry("M1Q5_Begg_3a", 30, oPC);
        }

}
