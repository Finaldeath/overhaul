//::///////////////////////////////////////////////
//:: Crystal Cutscene #1 (Area OnExit)
//:: hx_crystal1_exit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Journal entry
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 24, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC) == TRUE)
    {
        AddJournalQuestEntry("hx_crystal_journ", 10, oPC, TRUE, TRUE);

        //Give non-repeatable XP
        int i2daRow = 86;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
