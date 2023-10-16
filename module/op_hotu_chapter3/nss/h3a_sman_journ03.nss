//::///////////////////////////////////////////////
//:: Sleeping Man, Journal Entry (Action Script)
//:: H3a_SMan_Journ03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the XP2_Guardians entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Ocotber 28, 2003
//:://////////////////////////////////////////////

void main()
{
    //Add journal
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Guardians", 20, oPC, TRUE, TRUE);
}
