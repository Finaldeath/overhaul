//::///////////////////////////////////////////////
//:: m1q4D Area Property: On Enter
//:: m1q4D_Area_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script updates the player's journal when
    they enter the Aqueducts by boat (m1q4D)
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

    if (iDocksState < 110)
    {
        AddJournalQuestEntry("m1q4_Docks", 110, oPC);
    }
    AutoSave(oPC);
}
