 //::///////////////////////////////////////////////
//:: Player helped the Elk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Given a token they can give to Yusam.
    XP + other reward will be given by him.
    Also take the cure and give a spear.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

void main()
{
   GivePlayerYusamToken(GetPCSpeaker());
   TakePlagueCure(GetPCSpeaker());
   CreateItemOnObject("NW_HEN_DAE3QT", GetPCSpeaker());
   RewardXP("M3Q2_A11_DAMAS",50, GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q2D_CURE",1);
}
