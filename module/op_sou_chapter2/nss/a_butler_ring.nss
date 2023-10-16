//::///////////////////////////////////////////////
//:: Stone Butler (Action - Ring Journal Entry)
//:: A_Butler_Ring.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the "Stone Butler's Love" journal entry
     only if the Ashtara plot is still active.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 26, 2003
//:://////////////////////////////////////////////

void main()
{
    //Determine whether or not Ashtara's plot is already complete.
    object oAshtara = GetObjectByTag("Ashtara");
    int bPostPlot = GetLocalInt(oAshtara, "bPostPlot");
    //If not...
    if (bPostPlot == FALSE)
    {
        //Add Journal entry
        object oPC = GetPCSpeaker();
        AddJournalQuestEntry("Journ_Ashtara_30", 1, oPC, TRUE, TRUE);
    }
}
