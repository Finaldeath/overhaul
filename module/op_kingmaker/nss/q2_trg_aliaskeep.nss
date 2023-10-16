//::///////////////////////////////////////////////
//:: Alias Enters
//:: q2_trg_aliaskeep
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias drops the PC off at Serah
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oAlias = GetNearestObjectByTag("q2_alias");

    if(GetEnteringObject()== oAlias)
    {
        object oWay = GetObjectByTag("q2_way_aliashome");
        AssignCommand(oAlias,ActionJumpToObject(oWay));
    }
}
