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
    object oBecket = GetObjectByTag("q2_sirbecket");
    if(!os_CheckTriggerEntered()
        && GetEnteringObject()==oPC
        && GetLocalInt(GetModule(), "OS_BECKET_VOTES")<=2)
    {
        os_SetTriggerEntered();
        object oWay1 = GetObjectByTag("q2_way_assassin1");
        location lWay1 = GetLocation(oWay1);
        object oWay2 = GetNearestObjectByTag("q2_way_assassin2");
        location lWay2 = GetLocation(oWay2);
        object oAs1 = CreateObject(OBJECT_TYPE_CREATURE,"q2_assassin1",lWay1);
        object oAs2 = CreateObject(OBJECT_TYPE_CREATURE,"q2_assassin2",lWay2);
        object oAs3 = CreateObject(OBJECT_TYPE_CREATURE,"q2_assassin2",lWay2);
        AssignCommand(oAs1,ActionAttack(oPC));
        AssignCommand(oAs2,ActionAttack(oPC));
        AssignCommand(oAs3,ActionAttack(oPC));
        object oGarrot = GetObjectByTag("q2_garrot");
        if(GetLocalInt(oGarrot,"OS_GARROT_HELPED")==20)
        {
            AssignCommand(oGarrot,ActionJumpToObject(oWay1));
            ChangeToStandardFaction(oGarrot,STANDARD_FACTION_DEFENDER);
            AssignCommand(oGarrot,ActionAttack(oAs1));
        }
    }
}
