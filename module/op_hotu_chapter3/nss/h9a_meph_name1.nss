//::///////////////////////////////////////////////
//:: Mephistopheles, True Name Prevents Aribeth's Betrayal (Action Script)
//:: H9a_Meph_Name1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add journal entry indicating that Player
     used Aribeth's True Name to prevent her
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
    AddJournalQuestEntry("XP2_Name_Aribeth", 20, oPC, TRUE, TRUE, TRUE);
    SetLocalInt(GetModule(), "bAribethBetrays", FALSE);
    //Nix the romance
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");
    if (iRomance != 3)
    {
        SetLocalInt(GetModule(), "iAribethRomance", 0);
    }

    //Give non-repeatable XP
    int i2daRow = 142;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
