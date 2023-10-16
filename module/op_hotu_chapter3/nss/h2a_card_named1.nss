//::///////////////////////////////////////////////
//:: Arden Swift, Forced by True Name to Give Away His Winnings (Action Script)
//:: H2a_Card_Named1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gives the player a random amount of gold and
     the trumpet (if he still has it).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Arden", 20, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 138;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //Quantify his winnings
    int iGold = Random(100000)+200000;

    //Give gold
    GiveGoldToCreature(oPC, iGold);

    //Give trumpet if he still has it.
    object oTrumpet = GetItemPossessedBy(OBJECT_SELF, "H2_Trumpet");
    if (oTrumpet != OBJECT_INVALID)
    {
        SetLocalInt(GetModule(), "bWonTrumpet", TRUE);
        ActionGiveItem(oTrumpet, oPC);
    }

    //Flag the DoOnce
    SetLocalInt(OBJECT_SELF, "bGaveWinnings", TRUE);
}
