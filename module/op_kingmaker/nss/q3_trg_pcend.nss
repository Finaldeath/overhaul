//::///////////////////////////////////////////////
//:: q3_trg_pcend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sends the PC to the end cut scene
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered()
        && GetLocalInt(oPC,"OS_MOMMA_END")>0)
    {
        object oWay = GetObjectByTag("q2_way_tpc");
        os_SetTriggerEntered();
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oPC,ActionJumpToObject(oWay));
    }
}
