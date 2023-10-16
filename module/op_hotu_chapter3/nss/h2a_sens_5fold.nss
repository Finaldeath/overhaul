//::///////////////////////////////////////////////
//:: Githzerai Sensei, The Five-Fold Mysteries of the Sleeping Man (Action Script)
//:: H2a_Sens_5Fold.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the fact that the player has been
     informed of the existence of the Five-Fold
     Mysteries of the Sleeping Man
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bFiveFoldMysteries", TRUE);

    //Add journal entries
    object oPC = GetPCSpeaker();

    AddJournalQuestEntry("XP2_Pilgrims", 30, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 91;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    AddJournalQuestEntry("XP2_Mystery1", 10, oPC, TRUE, TRUE);
    AddJournalQuestEntry("XP2_Mystery2", 10, oPC, TRUE, TRUE);
    AddJournalQuestEntry("XP2_Mystery3", 10, oPC, TRUE, TRUE);
    AddJournalQuestEntry("XP2_Mystery4", 10, oPC, TRUE, TRUE);
    AddJournalQuestEntry("XP2_Mystery5", 10, oPC, TRUE, TRUE);
}
