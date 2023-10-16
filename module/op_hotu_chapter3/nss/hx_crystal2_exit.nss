//::///////////////////////////////////////////////
//:: Crystal Cutscene #2 (Area OnExit)
//:: hx_crystal2_exit.nss
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
        AddJournalQuestEntry("hx_crystal_journ", 20, oPC, TRUE, TRUE);

        //Give non-repeatable XP
        int i2daRow = 87;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
