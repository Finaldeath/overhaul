//::///////////////////////////////////////////////
//:: Arden Swift (OnDeath)
//:: H2_Dth_Arden.nss
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
    int bPostNames = GetLocalInt(GetModule(), "bKnower_ArdenNamed");
    if (bPostNames == TRUE)
    {
        AddJournalQuestEntry("XP2_Name_Arden", 50, oPC, TRUE, TRUE);
    }
    //Execute standard script.
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
