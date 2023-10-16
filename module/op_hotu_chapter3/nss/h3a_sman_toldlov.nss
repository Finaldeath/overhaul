//::///////////////////////////////////////////////
//:: Sleeping Man, Player Told Him the Name of His One True Love (Action Script)
//:: H2a_SMan_ToldLov.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the proper journal entry
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_SMansLove", 80, oPC, TRUE, TRUE, TRUE);
}
