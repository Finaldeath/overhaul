//::///////////////////////////////////////////////
//:: Quarry Grinder, Journal Entry (Action Script)
//:: H2a_Grind_Jour01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the 'Failed to Repair' journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Quarry", 40, oPC, TRUE, TRUE);
}
