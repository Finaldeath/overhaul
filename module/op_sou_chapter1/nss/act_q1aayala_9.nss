//::///////////////////////////////////////////////
//:: Name  act_q1aayala_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Set variables so that the PC can escape from conversation at this point
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    //Set Int on Ayala for conversation
    SetLocalInt(OBJECT_SELF, "Told_Main_Plot", 1);
    //Set Int on module for front door
    SetLocalInt(GetModule(), "X1_Q1AAYALATALK", 1);

    //Give XP for main quest assignation
    //give 200 or 275 if the PC skipped the cutscene (and the kobold battle)
    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
    {
        RewardXP("xpmid", 100, GetPCSpeaker(), ALIGNMENT_NEUTRAL, TRUE);
    }
    else
    {
        RewardXP("xphigh", 55, GetPCSpeaker(), ALIGNMENT_NEUTRAL, TRUE);
    }
}
