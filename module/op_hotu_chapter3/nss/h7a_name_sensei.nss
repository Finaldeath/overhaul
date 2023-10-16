//::///////////////////////////////////////////////
//:: The Knower of Names, Give Sensei's Name (Action Script)
//:: H7a_Name_Sensei.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing Sensei's True
     Name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bKnower_SenseiNamed", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Sensei", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 180;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
