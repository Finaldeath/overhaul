//::///////////////////////////////////////////////
//:: m1q3B Area Script: OnEnter
//:: m1q3B_Area_1
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Updates the quest log
    when player enters Meldanen estate, but only if they are
    already on the Milli.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: may 10, 2002
//:://////////////////////////////////////////////
#include "NW_I0_Plot"
#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();
    int iBackDoorState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q3_SecretEntrance");

    if (iBackDoorState > 0)
    {
        AddJournalQuestEntry("m1q3_SecretEntrance", 15, oPC);
    }
    AutoSave(oPC);
}

