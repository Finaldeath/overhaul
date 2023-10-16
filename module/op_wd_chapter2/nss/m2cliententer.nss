//::///////////////////////////////////////////////
//:: Chapter 2 Module Script: OnClientEnter
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adds the first entry in the main Ch 2 journal
    category to anyone entering the module.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 22, 2002
//:://////////////////////////////////////////////

void main()
{
    AddJournalQuestEntry("m2q0_Main", 10, GetEnteringObject());
}
