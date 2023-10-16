//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Give Artifact (Action Script)
//:: H2a_Gruul_Artif.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player used True Name to gain artifact.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Give player the artifact
    object oPC = GetPCSpeaker();
    CreateItemOnObject("h2_gruul_artifac", oPC);

    //Journal entry
    AddJournalQuestEntry("XP2_Name_Gruul", 50, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 163;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
