//::///////////////////////////////////////////////
//:: Damas, Catapult reward
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") + 1);
    RewardGP(500, GetPCSpeaker());
    RewardXP("M3Q2_A11_DAMAS",25, GetPCSpeaker());
}
