//::///////////////////////////////////////////////
//:: The Knower of Names, Give Own Name (Action Script)
//:: H7a_Name_Names.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing the True Name of
     the Knower of Names
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bKnower_NamesNamed", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Names", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 164;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
