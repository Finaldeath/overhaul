//:://////////////////////////////////////////////
/*
    Updates and closes the Find Krestal quest log
    when Krestal dies. Finds the nearest player
    charatcer and gives him the journal entry only
    if he is on the plot to find Krestal in the
    first place.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Dec 15, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
    int iKrestalState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_2a");

    if (iKrestalState > 1)
        {
            AddJournalQuestEntry("M1Q5_Begg_2a", 30, oPC);
        }

}
