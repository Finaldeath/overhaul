//::///////////////////////////////////////////////
//:: Reward for Bandit Head
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 16 2001
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    RewardGP(500, GetPCSpeaker());
    RewardXP("M3Q1_A07_BANDIT_PLOT",25,GetPCSpeaker(),ALIGNMENT_NEUTRAL);
}