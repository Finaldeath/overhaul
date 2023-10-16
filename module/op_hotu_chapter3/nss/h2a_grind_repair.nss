//::///////////////////////////////////////////////
//:: Quarry Grinder, Repair Self (Action Script)
//:: H2a_Grind_Repair.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Quarry Grinder 5 repairs and reactivates
     itself.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(OBJECT_SELF, "bDismantled", FALSE);
    SetLocalInt(OBJECT_SELF, "bActivated", TRUE);
    SetLocalInt(OBJECT_SELF, "bQuestComplete", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Quarry", 70, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 102;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
