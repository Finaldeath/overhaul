//::///////////////////////////////////////////////
//:: Witch Wake 1: Night Hag, Journal entries
//:: WW1_Hag_Journal.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives a journal entry based on whether or not
     the player refused her help.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 6, 2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    int iDeaths = GetLocalInt(oPC, "iDeaths");

    //if the player refused the Hag's help, they'll be set to 3 deaths.
    if (iDeaths == 3)
    {
        AddJournalQuestEntry("WW_CavanaughStone", 10, oPC, FALSE);
    }
    //otherwise, assume they accepted the Hag's help
    else
    {
        AddJournalQuestEntry("WW_CavanaughStone", 20, oPC, FALSE);
    }
}
