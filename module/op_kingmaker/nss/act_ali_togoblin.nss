//::///////////////////////////////////////////////
//:: act_ali_togoblin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Alias takes PC to Serah's caves. This doesn't
     set variables.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oWay = GetObjectByTag("q3_way_serahcave");
    object oPC = GetFirstPC();

    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",1);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION",20);
    os_MoveParty(oWay,oPC);
    DelayCommand(0.5,ActionJumpToObject(oWay));
}
