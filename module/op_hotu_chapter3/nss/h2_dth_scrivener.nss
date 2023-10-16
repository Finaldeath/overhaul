//::///////////////////////////////////////////////
//:: The Scrivener (OnDeath)
//:: H2_Dth_Scrivener.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Journal Entry
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 23, 2003
//:://////////////////////////////////////////////

void main()
{
    //Journal Entry
    object oPC = GetFirstPC();
    AddJournalQuestEntry("XP2_Scrivener", 70, oPC, TRUE, TRUE);

    //Execute standard henchman script.
    ExecuteScript("x2_hen_death", OBJECT_SELF);
}
