//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set that PC was rewarded for freeing Becka, and
    give PC reward of Amulet of Natural Armor + 1.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 28, 2003
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "X1_Q1RuralRebFree", 99);
    CreateItemOnObject("it_mneck002",GetPCSpeaker());
    RewardXP("xpmid",50,GetPCSpeaker());
}
