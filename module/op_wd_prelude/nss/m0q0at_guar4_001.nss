//:://////////////////////////////////////////////
/*
    Updates all four of the training quests if the player skips
    Speaking with the instructors after completing the actual
    Tests. This script is on the guard at the exit.
    It also opens the door allowing hte player access to
    the Graduation Room.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Feb 27, 2002
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetEnteringObject();

    SignalEvent(GetObjectByTag("M0Q1B_M0Q1C"),EventUserDefined(1));

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM0Q1_Arcane") > 0)
        {
            AddJournalQuestEntry("M0Q1_Arcane", 20, oPC, TRUE, TRUE);
        }
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM0Q1_Combat") > 0)
        {
            AddJournalQuestEntry("M0Q1_Combat", 40, oPC, TRUE, TRUE);
        }
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q0_Divine") > 0)
        {
            AddJournalQuestEntry("M0Q1_Divine", 30, oPC, TRUE, TRUE);
        }
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q0_Rogue") > 0)
        {
            AddJournalQuestEntry("M0Q1_Rogue", 20, oPC, TRUE, TRUE);
        }
    }
}

