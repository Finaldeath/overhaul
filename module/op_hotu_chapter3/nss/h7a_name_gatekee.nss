//::///////////////////////////////////////////////
//:: The Knower of Names, Give Gatekeeper's Name (Action Script)
//:: H7a_Name_Gatekee.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing the Gatekeeper's True
     Name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bKnower_GatekeeperNamed", TRUE);

    //Add the Journal Entries
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Main", 70, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 83;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
    AddJournalQuestEntry("XP2_Name_Gatekeeper", 10, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    i2daRow = 154;
    bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
