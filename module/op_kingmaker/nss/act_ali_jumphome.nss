//::///////////////////////////////////////////////
//:: Alias Goes home
//:: act_ali_jumphome
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias jumps back to the fountain
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q2_way_aliashome");
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST",0);
    ActionJumpToObject(oWay);
}
