//::///////////////////////////////////////////////
//:: Name hx_denprison_ent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Starts the prisoner journal entries.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    int iDone = GetLocalInt(GetArea(OBJECT_SELF), "HX_PRISONER_SEEN");

    if(GetIsPC(oPC) && iDone != 1)
    {
        SetLocalInt(GetArea(OBJECT_SELF), "HX_PRISONER_SEEN", 1);
        AddJournalQuestEntry("hx_prisoner", 10, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 116;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
