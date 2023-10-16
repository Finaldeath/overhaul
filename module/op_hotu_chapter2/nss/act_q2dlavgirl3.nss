//::///////////////////////////////////////////////
//:: Name act_q2dlavgirl3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Slave girl runs off towards the Seer on a mission
    from the PC.
    Set a variable so that she will appear there (the temple of Lloth)
    next time the PC is there.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();

    AddJournalQuestEntry("q2_femslave",30,oPC);
    Reward_2daXP(oPC, 46);

    SetGlobalInt("X2_Q2DFreedSlaveGirl", 1);

    object oGirl = OBJECT_SELF;
    SetPlotFlag(oGirl, TRUE);
    DelayCommand(9.8, SetPlotFlag(oGirl, FALSE));

    DestroyObject(oGirl, 10.0);
    ActionMoveAwayFromObject(oPC, TRUE);
    SetCommandable(FALSE, oGirl);

}
