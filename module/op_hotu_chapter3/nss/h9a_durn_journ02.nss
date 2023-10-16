//::///////////////////////////////////////////////
//:: Durnan, Journal Entry (Action Script)
//:: H9a_Durn_Journ02.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the XP2_Main journal entry outlining
     Mephistopheles' appearance.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Main", 100, oPC, TRUE, TRUE);
}
