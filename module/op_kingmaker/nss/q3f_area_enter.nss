//::///////////////////////////////////////////////
//:: Area Enter
//:: q3f_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC enters the undead caves; two enemy undead start fighting
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && os_CheckAreaEntered())
    {
        DoSinglePlayerAutoSave();
        os_SetAreaEntered();
        object oWay = GetObjectByTag("q3_way_undead");
        location lWay = GetLocation(oWay);
        object oZombie = CreateObject(OBJECT_TYPE_CREATURE,"q3_zombie",lWay);
        object oSkel = CreateObject(OBJECT_TYPE_CREATURE,"q3_skeleton",lWay);
        AssignCommand(oZombie,ActionAttack(oSkel));
        AssignCommand(oSkel,ActionAttack(oZombie));
    }
}
