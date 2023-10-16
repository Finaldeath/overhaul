//::///////////////////////////////////////////////
//:: Start Assassination
//:: q2_trg_gelassa
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the conversation with Gelani
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oGelani = GetObjectByTag("q2_gelani");
    object oPC = GetFirstPC();
    object oThad = GetObjectByTag("q2_thaddeus");
    if(GetEnteringObject()==oPC
        && !os_CheckTriggerEntered()
        && GetLocalInt(GetModule(), "OS_KILLGELANI")==15)
    {
        os_SetTriggerEntered();
        AssignCommand(oPC,ClearAllActions(TRUE));
        AssignCommand(oGelani,ActionStartConversation(oPC));
    }
}
