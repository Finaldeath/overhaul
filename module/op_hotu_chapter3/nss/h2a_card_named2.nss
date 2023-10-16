//::///////////////////////////////////////////////
//:: Arden Swift, Forced by True Name to Fight Tavernkeeper (Action Script)
//:: H2a_Card_Named2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Makes Arden attack the Tavernkeeper
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Arden", 30, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 139;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //Make him hostile to the tavernkeeper.
    object oKeeper = GetObjectByTag("H2_Tavernkeeper");
    AdjustReputation(oKeeper, OBJECT_SELF, -100);

    //Move him to the tavernkeeper so they'll fight.
    ActionForceMoveToObject(oKeeper);
}
