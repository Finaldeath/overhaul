//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets Haniah as very annoyed with the PC and gives
     50% XP.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetPCSpeaker(),"HANIAHLOVE",10);
    RewardXP("xplow",50,GetPCSpeaker());
}
