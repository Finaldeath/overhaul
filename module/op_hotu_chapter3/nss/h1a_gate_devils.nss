//::///////////////////////////////////////////////
//:: Gatekeeper, Devils Allowed to Swarm the Planes (Action Script)
//:: H1a_Gate_Devils.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper to let the Devils swarm across
     the Planes.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_DevilHome", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Gatekeeper", 40, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 157;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
