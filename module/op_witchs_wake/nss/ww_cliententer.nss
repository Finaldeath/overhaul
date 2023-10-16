//::///////////////////////////////////////////////
//:: Client OnEnter
//:: WW_ClientEnter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the credits and subrace journal entries.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 2, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int iDoOnce = GetLocalInt(oPC, "WW_SUBRACE_JOURNAL_ADDED");

    if (iDoOnce == FALSE)
    {
        //Add the CREDITS journal entry
        //AddJournalQuestEntry("CREDITS", 1, oPC);

        //Add the SUBRACE journal entries
        AddJournalQuestEntry("SUBRACES_DWARF", 1, oPC);
        AddJournalQuestEntry("SUBRACES_ELF", 1, oPC);
        AddJournalQuestEntry("SUBRACES_GNOME", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HALF-ELF_1", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HALF-ELF_2", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HALF-ELF_3", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HALF-ORC_1", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HALF-ORC_2", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HALFLING", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HUMAN_1", 1, oPC);
        AddJournalQuestEntry("SUBRACES_HUMAN_2", 1, oPC);

        //Flag the per player DoOnce
        SetLocalInt(oPC, "WW_SUBRACE_JOURNAL_ADDED", TRUE);
    }
}
