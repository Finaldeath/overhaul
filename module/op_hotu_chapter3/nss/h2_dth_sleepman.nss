//::///////////////////////////////////////////////
//:: Sleeping Man (OnDeath)
//:: H2_Dth_SleepMan.nss
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
    AddJournalQuestEntry("XP2_Name_SMansLove", 130, oPC, TRUE, TRUE);
    int bNamed = GetLocalInt(GetModule(), "bKnower_SleepingManNamed");
    if (bNamed == TRUE)
    {
        AddJournalQuestEntry("XP2_Name_SMan", 50, oPC, TRUE, TRUE);
    }

    //Execute standard script.
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
