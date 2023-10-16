//::///////////////////////////////////////////////
//:: Janis being rescued
//:: m2q2janrngxp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Janis being rescued
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 14, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Rescued",10);
    RewardXP("M2Q2_Revat",60, GetPCSpeaker());
}
