//::///////////////////////////////////////////////
//:: Alias Home
//:: act_ali_takehome
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias takes the players and party home to the keep
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q2_way_aliashome");
    object oPC = GetFirstPC();
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",0);
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
