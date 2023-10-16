//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Arzig declares PC friend, gives 100 XP.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetModule(),"X1_Q5CHAMPION",10);
    RewardXP("xplow",50, oPC);
    //Set all kobold factions neutral to the PC
    object oGuard = GetObjectByTag("Q5_KOBOLD_GUARD_FACTION");
    object oCommoner = GetObjectByTag("Q5_KOBOLD_COMMONER_FACTION");

    AdjustFactionReputation(oPC, oGuard, 50);
    AdjustFactionReputation(oPC, oCommoner, 50);
}
