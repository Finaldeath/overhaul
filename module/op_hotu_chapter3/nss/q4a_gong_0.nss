//::///////////////////////////////////////////////
//:: FileName q4a_gong_0
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/15/2003 12:53:05 PM
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    // Inspect local variables
    if(GetLocalInt(OBJECT_SELF, "q4a_gong_ear") == 0)
    {
        object oPC = GetPCSpeaker();
        AddJournalQuestEntry("q4a_gargs", 40, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 122;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
        return TRUE;
    }
    return FALSE;
}
