//::///////////////////////////////////////////////
//:: act_alias_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias takes PC to Serah's caves. The First time
     WARNING: DO THIS ONCE! BECAUSE IT SETS VARIABLES
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q3_way_serahcave");
    object oPC = GetFirstPC();
    object oMap = GetObjectByTag("q1ab_mn_serahcave");

    SetMapPinEnabled(oMap,1);

    SetLocalInt(oPC,"os_serahcaves",20);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_VOTE",0);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",1);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION",20);

    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
