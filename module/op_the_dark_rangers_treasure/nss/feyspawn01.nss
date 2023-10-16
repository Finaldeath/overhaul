//::///////////////////////////////////////////////
//:: Fey Spawn Script #1
//:: FeySpawn01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Activates the Fey encounters when the player
    exits the Dark Ranger's ruins. Sets the
    MainPlot local to 2 and adds the journal
    entry.
*/
//:://////////////////////////////////////////////

void main()
{
    //Activate Fey Encounters
    int iNth = 0;
    object oEncounter = GetObjectByTag("Fey", iNth);
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    if (iMainPlot < 2)
    {
        while (oEncounter != OBJECT_INVALID)
        {
            SetEncounterActive(TRUE, oEncounter);
            iNth++;
            oEncounter = GetObjectByTag("Fey", iNth);
        }

        //Set MainPlot local
        SetLocalInt(GetModule(), "MainPlot", 2);

        //Add journal entry
        object oPC = GetExitingObject();
        AddJournalQuestEntry("DarkRanger", 50, oPC);
    }
}
