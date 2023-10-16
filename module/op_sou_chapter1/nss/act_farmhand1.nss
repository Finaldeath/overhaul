//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the local saying fight is talked about and
     rewards given. Give XP. Give all weapons back(Keith).
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 29, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_FARMFIGHT",99);
    RewardXP("xplow",50,GetPCSpeaker());
}
