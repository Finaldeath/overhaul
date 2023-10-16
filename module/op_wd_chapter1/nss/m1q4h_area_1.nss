//::///////////////////////////////////////////////
//:: m1q4H Area Property: On Enter
//:: m1q4H_Area_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script updates the player's journal when
    they enter the basement of the Seedy Tavern
    (m1q4H)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 14, 2001
//:://////////////////////////////////////////////
#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();
    int iDocksState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q4_Docks");

    if (iDocksState < 70)
    {
        AddJournalQuestEntry("m1q4_Docks", 70, oPC);
    }
    AutoSave(oPC);
}
