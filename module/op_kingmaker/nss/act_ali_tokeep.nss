//::///////////////////////////////////////////////
//:: act_ali_tokeep
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias takes PC to the keep.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q2_way_keep");
    object oPC = GetFirstPC();
    os_MoveParty(oWay,oPC);
}
