//::///////////////////////////////////////////////
//:: m2q4 High Captain Baram Action Script #1
//:: m2q4_BaramA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if Baram is the first High
    Captain talked to and update the journal
    entries accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iMainState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q4_Main");

    if (iMainState == 0)
    {
        AddJournalQuestEntry("m2q4_Main", 20, oPC);
    }

    if (iMainState == 10)
    {
        AddJournalQuestEntry("m2q4_Main", 30, oPC);
    }
}
