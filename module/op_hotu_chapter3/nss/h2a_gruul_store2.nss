//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Store 2 (Action Script)
//:: H2a_Gruul_Store2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player used True Name to force Gru'ul to
     open his store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Flag store as viewable.
    SetLocalInt(OBJECT_SELF, "bStoreViewed", TRUE);

    //Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Gruul", 30, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 161;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
