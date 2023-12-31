//::///////////////////////////////////////////////
//:: Scrivener, 2nd-Fold Mystery Learned (Action Script)
//:: H2a_Scrv_Learn2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the fact that the player has learned
     the 2nd-fold mystery of the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //If this Mystery hasn't been learned yet...
    object oPC = GetPCSpeaker();
    int bMystery = GetLocalInt(GetModule(), "bMystery2Learned");
    if (bMystery == FALSE)
    {
        //Increment the generic journal entry to keep track of the number of
        //Mysteries learned
        int iTotalMysteries = GetLocalInt(GetModule(), "iTotalMysteriesLearned");
        switch (iTotalMysteries)
        {
            case 0:
            {
                AddJournalQuestEntry("XP2_Pilgrims", 40, oPC, TRUE, TRUE);
            }
            break;
            case 1:
            {
                AddJournalQuestEntry("XP2_Pilgrims", 50, oPC, TRUE, TRUE);
            }
            break;
            case 2:
            {
                AddJournalQuestEntry("XP2_Pilgrims", 60, oPC, TRUE, TRUE);
            }
            break;
            case 3:
            {
                AddJournalQuestEntry("XP2_Pilgrims", 70, oPC, TRUE, TRUE);
            }
            break;
            case 4:
            {
                AddJournalQuestEntry("XP2_Pilgrims", 80, oPC, TRUE, TRUE);
            }
            break;
        }
        //Add Mystery-Specific journal entry
        AddJournalQuestEntry("XP2_Mystery2", 30, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 133;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
        //Increment the total
        SetLocalInt(GetModule(), "iTotalMysteriesLearned", iTotalMysteries+1);
        //Flag the local
        SetLocalInt(GetModule(), "bMystery2Learned", TRUE);
    }
}
