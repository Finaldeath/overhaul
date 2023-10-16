//::///////////////////////////////////////////////
//:: Name hx_wolfquest_st
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will start the wolf quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "HX_WOLF_QUEST", 1);
    // Set journal to alpha giving quest.
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Wolves", 20, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 60;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
