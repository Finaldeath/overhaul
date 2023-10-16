//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2bpris001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Darius updates the journal only if the PC has
    talked to Jax.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q2_Jax") == 10)
    {
        AddJournalQuestEntry("m2q2_Jax",20,oPC);
    }
}
