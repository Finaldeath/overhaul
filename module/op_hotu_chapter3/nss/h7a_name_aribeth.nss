//::///////////////////////////////////////////////
//:: The Knower of Names, Give Aribeth's Name (Action Script)
//:: H7a_Name_Aribeth.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing Aribeth's True
     Name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bKnower_AribethNamed", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Aribeth", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 141;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
