//::///////////////////////////////////////////////
//:: m1q1k Area Script: OnEnter
//:: m1q1k_Area_1
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Updates player journal on enter to Chapter 1
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////
#include "NW_I0_Plot"
#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        AddJournalQuestEntry("m1q1_Main", 5, oPC);

    }
    AutoSave(oPC);
}

