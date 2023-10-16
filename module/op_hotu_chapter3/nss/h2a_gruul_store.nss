//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Open Store (Action Script)
//:: H2a_Gruul_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Opens Gru'ul's store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oStore = GetObjectByTag("H2_GruulStore");
    OpenStore(oStore, oPC);

    //Add journal entry
    AddJournalQuestEntry("XP2_Quarry", 100, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 105;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //Flag variable
    SetLocalInt(OBJECT_SELF, "bStoreViewed", TRUE);
}
