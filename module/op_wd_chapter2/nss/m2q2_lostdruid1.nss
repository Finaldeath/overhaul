//::///////////////////////////////////////////////
//:: m2q2 Lost Druid Journal Script #1
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks the state of the m2q2_Druids journal
    category and increments it accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iDruidState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q2_Druids");

    switch (iDruidState)
    {
        case 0:
        case 10:
        {
            AddJournalQuestEntry("m2q2_Druids", 20, oPC);
        }
        break;

        case 20:
        {
            AddJournalQuestEntry("m2q2_Druids", 30, oPC);
        }

        case 30:

        {
            AddJournalQuestEntry("m2q2_Druids", 40, oPC);
        }
    }
}
