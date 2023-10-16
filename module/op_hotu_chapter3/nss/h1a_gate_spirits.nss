//::///////////////////////////////////////////////
//:: Gatekeeper, Spirits of the Dead Allowed to Haunt (Action Script)
//:: H1a_Gate_Spirits.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper to let the Spirits of the Dead
     haunt the Land of the Living.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_SpiritHome", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Gatekeeper", 30, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 156;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
