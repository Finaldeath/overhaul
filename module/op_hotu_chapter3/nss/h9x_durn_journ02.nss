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

    // Set all betrayals active. This is so that if the PC skips the dialog
    // they aren't able to get out of the betrayals. This variable will be reset
    // accordingly if they go through the dialog.
    SetLocalInt(GetModule(), "bAribethBetrays", TRUE);
    SetLocalInt(GetModule(), "bDeekinBetrays", TRUE);
    SetLocalInt(GetModule(), "bValenBetrays", TRUE);
    SetLocalInt(GetModule(), "bNathyrraBetrays", TRUE);
}
