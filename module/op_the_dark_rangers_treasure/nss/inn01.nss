//::///////////////////////////////////////////////
//:: Inn of the Lance Area Script #1
//:: Inn01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the MainPlot local is set to 2 (players
    have left the Ruins area), seal the inn door.
    Set journal entries.
*/
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    if (iMainPlot == 2)
    {
        SetLocalInt(GetModule(), "InnSealed", TRUE);

        //Set Journal State 60
        AddJournalQuestEntry("DarkRanger", 60, oPC);
    }

    //Set Journal State 10
    else
    {
        AddJournalQuestEntry("DarkRanger", 10, oPC);
    }
}
