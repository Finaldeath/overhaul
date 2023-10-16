//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss (OnDeath)
//:: H2_Dth_Gruul.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Journal Entries
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 23, 2003
//:://////////////////////////////////////////////

void main()
{
    //Journal Entries
    object oPC = GetFirstPC();
    AddJournalQuestEntry("XP2_Quarry", 110, oPC, TRUE, TRUE);
    int bPostNames = GetLocalInt(GetModule(), "bKnower_GruulNamed");
    if (bPostNames == TRUE)
    {
        AddJournalQuestEntry("XP2_Name_Gruul", 60, oPC, TRUE, TRUE);
    }

    //Execute standard script.
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
