//::///////////////////////////////////////////////
//:: Dylan Initiates
//:: q2ab_init_dylan
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dylan initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        AssignCommand(oPC,ClearAllActions(TRUE));
        object oDylan = GetObjectByTag("q2_dylan");
        AssignCommand(oDylan,ActionStartConversation(oPC));
    }
}
