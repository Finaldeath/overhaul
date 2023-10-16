//::///////////////////////////////////////////////
//:: q3ac_key_gold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player moves to the gold key door
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oWay = GetObjectByTag("q3ac_way_gold");
    os_MoveParty(oWay,oPC);
//    SetLocalInt(oPC,"OS_Q3C_DOOR",6);
//    q3_JumpToDoor("q3ac_way_gold");
}
