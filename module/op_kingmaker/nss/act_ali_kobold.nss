//::///////////////////////////////////////////////
//:: act_ali_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias takes PC to the kobold caves.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q3_map_kobold");
    object oPC = GetFirstPC();
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",1);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION",50);
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
