//::///////////////////////////////////////////////
//::
//:: act_q2aslave_1
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Increments the L_TalkLevel local each time
//::
//:: XP for good characters and alignment shift f
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Brent Knowles
//:: Created On: April 20, 2001
//::
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();

    AdjustAlignment(oPC, ALIGNMENT_GOOD, 3);
    AddJournalQuestEntry("q2_femslave", 99, oPC);
    if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
    {
        Reward_2daXP(oPC, 58);
    }
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") + 1);
}
