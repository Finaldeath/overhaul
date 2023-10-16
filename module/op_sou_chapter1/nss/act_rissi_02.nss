//::///////////////////////////////////////////////
//:: Name  act_rissi_02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Riisi will give the PC some minor items... and
    25% XP and sets local that Riisi plot is done.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(OBJECT_SELF, "nFetchingItems", 2);
    object oPC = GetPCSpeaker();
    CreateItemOnObject("q1a2drogankey", oPC);
    CreateItemOnObject("focuscrystal", oPC);
    CreateItemOnObject("focuscrystal", oPC);
    CreateItemOnObject("focuscrystal", oPC);
    CreateItemOnObject("nw_it_sparscr210", oPC);
    RewardXP("xplow",25,GetPCSpeaker());
    SetLocalInt(GetModule(),"XP1_RIISISPEAK",99);
}
