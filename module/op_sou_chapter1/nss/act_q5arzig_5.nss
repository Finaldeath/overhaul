//::///////////////////////////////////////////////
//:: Name act_q5arzig_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give rod of rule to PC from Arzig.
    Give 1/2 xp
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 24/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    object oArzig = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oArzig, "q5rodofruler");
    DestroyObject(oRod);
    CreateItemOnObject("q5rodofruler", oPC);
    RewardXP("xpmid", 50, oPC);

    //Set all kobold factions neutral to the PC
    object oGuard = GetObjectByTag("Q5_KOBOLD_GUARD_FACTION");
    object oCommoner = GetObjectByTag("Q5_KOBOLD_COMMONER_FACTION");

    AdjustFactionReputation(oPC, oGuard, 50);
    AdjustFactionReputation(oPC, oCommoner, 50);

    SetLocalInt(GetModule(),"X1_Q5CHAMPION",10);

}
