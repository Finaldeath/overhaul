//:://////////////////////////////////////////////
/*
    Updates the JOUR_M1Q0Training quest log when players
    enter the Academy for the first time.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Feb 27, 2002
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC)&& (GetLocalInt(oPC, "NW_JOURNAL_ENTRYJOUR_M1Q0Training") < 10))
    {
         AddJournalQuestEntry("JOUR_M1Q0Training", 10, oPC, TRUE, TRUE);
    }
}

