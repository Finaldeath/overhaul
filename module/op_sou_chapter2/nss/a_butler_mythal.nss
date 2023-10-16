//::///////////////////////////////////////////////
//:: Stone Butler (Action - Mythal Journal Entry)
//:: A_Butler_Mythal.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the mythal journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 26, 2003
//:://////////////////////////////////////////////

void main()
{
    //Add Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("Journ_Main_20", 1, oPC, TRUE, TRUE);
}
