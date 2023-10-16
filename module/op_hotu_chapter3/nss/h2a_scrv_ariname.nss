//::///////////////////////////////////////////////
//:: Scrivener, Aribeth's Name (Action Script)
//:: H2a_Scrv_AriName.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing Aribeth's name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 11, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Flag the Quest as being completed.
    SetLocalInt(GetModule(), "bAribethsNameKnown", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Aribeth", 30, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 64;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
