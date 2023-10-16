//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take baby, give 50 XP, give 500 gold, set local
     to make parents angry if they are still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 7, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(OBJECT_SELF, "nBoughtSlave", 1);
    object oBaby = GetLocalObject(GetModule(), "X1Q1BBaby");
    object oPC = GetPCSpeaker();
    DestroyObject(oBaby);
    GiveGoldToCreature(oPC,500);
    RewardXP("xplow",50,oPC);
}
