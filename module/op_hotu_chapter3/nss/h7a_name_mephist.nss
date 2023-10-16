//::///////////////////////////////////////////////
//:: The Knower of Names, Give Mephistopheles' Name (Action Script)
//:: H7a_Name_Mephist.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as knowing Mephistopheles' True
     Name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bKnower_MephistophelesNamed", TRUE);

    //Add journal entries
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Mephisto", 10, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 169;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
    AddJournalQuestEntry("XP2_Name_Names", 20, oPC, TRUE, TRUE, TRUE);
    //Give non-repeatable XP
    i2daRow = 165;
    bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
