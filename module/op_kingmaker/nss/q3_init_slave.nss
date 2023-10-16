//::///////////////////////////////////////////////
//:: q3_init_slave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The slave initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oSlave = GetNearestObjectByTag("q3_hslave");

    if(GetEnteringObject()== oPC
      && GetIsObjectValid(oSlave)
      && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.1, AssignCommand(oSlave,ActionStartConversation(oPC)));
    }
}
