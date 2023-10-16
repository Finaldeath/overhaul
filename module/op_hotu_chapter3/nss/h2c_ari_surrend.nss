//::///////////////////////////////////////////////
//:: Aribeth, Surrender (Condition Script)
//:: H2c_Ari_Surrend.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth has surrendered and
     this line has not been spoken before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bSurrenderDoOnce");
    int bSurrendered = GetLocalInt(OBJECT_SELF, "Generic_Surrender");
    if (bDoOnce == FALSE &&
        bSurrendered == TRUE)
    {
        //Add journal entry
        AddJournalQuestEntry("XP2_Aribeth", 80, GetFirstPC(), TRUE, TRUE);

        //Give non-repeatable XP
        object oPC = GetPCSpeaker();
        int i2daRow = 66;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }

        SetLocalInt(OBJECT_SELF, "bSurrenderDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
