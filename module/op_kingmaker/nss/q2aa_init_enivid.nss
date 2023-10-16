//::///////////////////////////////////////////////
//:: Enivid Initiates
//:: q2aa_init_enivid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Enivid initiates with the player
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
        object oEnivid = GetObjectByTag("q2_enivid");
        AssignCommand(oEnivid,ActionStartConversation(oPC));
    }
}
