//::///////////////////////////////////////////////
//:: Assassins Attack
//:: q2_trg_assassin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Assassins attack the PC if Beckett's votes are low
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oGelani = GetObjectByTag("q2_gelani");
    if(!os_CheckTriggerEntered()
        && GetEnteringObject()==oPC
        && GetLocalInt(GetModule(), "OS_HELPGELANI")==99)
    {
        os_SetTriggerEntered();
        object oWay2 = GetNearestObjectByTag("q2_way_assassin3");
        location lWay2 = GetLocation(oWay2);
        object oAs2 = CreateObject(OBJECT_TYPE_CREATURE,"q2_assassin3",lWay2);
        object oAs3 = CreateObject(OBJECT_TYPE_CREATURE,"q2_assassin3",lWay2);
        AssignCommand(oAs2,ActionAttack(oPC));
        AssignCommand(oAs3,ActionAttack(oPC));
    }
}
