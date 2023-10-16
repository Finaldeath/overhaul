//::///////////////////////////////////////////////
//:: Mephistopheles, True Name Prevents Deekin's Betrayal (Action Script)
//:: H9a_Meph_Name4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add journal entry indicating that Player
     used Deekin's True Name to prevent her
     betrayal.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 18, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Deekin", 20, oPC, TRUE, TRUE, TRUE);
    SetLocalInt(GetModule(), "bDeekinBetrays", FALSE);
    //Give non-repeatable XP
    int i2daRow = 150;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
