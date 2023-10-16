//::///////////////////////////////////////////////
//:: Mephistopheles, True Name Prevents Valen's Betrayal (Action Script)
//:: H9a_Meph_Name3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add journal entry indicating that Player
     used Valen's True Name to prevent his
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
    AddJournalQuestEntry("XP2_Name_Valen", 20, oPC, TRUE, TRUE, TRUE);
    SetLocalInt(GetModule(), "bValenBetrays", FALSE);
    //Nix the romance
    int iRomance = GetLocalInt(GetModule(), "iValenRomance");
    if (iRomance != 3)
    {
        SetLocalInt(GetModule(), "iValenRomance", 0);
    }

    //Give non-repeatable XP
    int i2daRow = 203;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
