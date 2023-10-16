//::///////////////////////////////////////////////
//:: Gatekeeper, Githzerai Pilgrims Allowed Home (Action Script)
//:: H1a_Gate_Pilgrim.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper to let the Pilgrims return home
     to Limbo.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_PilgrimHome", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Gatekeeper", 20, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 155;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
