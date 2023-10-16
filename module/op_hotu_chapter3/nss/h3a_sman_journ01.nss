//::///////////////////////////////////////////////
//:: Sleeping Man, Journal Entry (Action Script)
//:: H3a_SMan_Journ01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the XP2_Pilgrims entry indicating amulet
     failure.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Pilgrims", 120, oPC, TRUE, TRUE);
}
