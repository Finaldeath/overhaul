//::///////////////////////////////////////////////
//:: Module Entry Journal Script
//:: ModuleJournal.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Places the initial journal entries on anyone
    who enters.
*/
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    AddJournalQuestEntry("MainPlot", 10, oPC);
}
