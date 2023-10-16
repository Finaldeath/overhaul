//::///////////////////////////////////////////////
//:: act_ali_duergar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias takes PC to the duergar caves.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q3_map_duergar");
    object oPC = GetFirstPC();
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",1);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION",40);
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
