//::///////////////////////////////////////////////
//:: q1_init_hengrove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala initiates in her grove
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
        && !os_CheckTriggerEntered())
    {
        object oKai = GetNearestObjectByTag("os_hen_kai");
        if(GetIsObjectValid(oKai)
            && GetLocalInt(GetFirstPC(), "OS_KAI_PLANT") == 40)
        {
            SetTime(23,1,1,1);
            os_SetTriggerEntered();
            SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",50);
            AssignCommand(oPC,ClearAllActions(TRUE));
            AssignCommand(oKai,ClearAllActions(TRUE));
            AssignCommand(oKai,JumpToObject(oPC));
            AssignCommand(oKai,ActionStartConversation(oPC));
        }
    }
}
