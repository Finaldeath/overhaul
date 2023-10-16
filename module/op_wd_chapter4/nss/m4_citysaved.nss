//::///////////////////////////////////////////////
//:: M4_CITYSAVED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rewards player for killing golems and catapults if they haven't already.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_G_FINALREWARD") == 10)
    {
        return; // exit if reward already given
    }

    if (GetLocalInt(OBJECT_SELF,"NW_G_M4GOLEM")==0
        && GetLocalInt(OBJECT_SELF,"NW_G_M4CATAPULT")==0)
    {
        SetLocalInt(OBJECT_SELF, "NW_G_FINALREWARD", 10);
        RewardXP("M4Q01_SIEGE",50,GetPCSpeaker());
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "NW_G_FINALREWARD", 10);
        RewardXP("M4Q01_SIEGE",25,GetPCSpeaker());
    }
}
