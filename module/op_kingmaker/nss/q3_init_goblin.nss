//::///////////////////////////////////////////////
//:: Goblin Initiates
//:: q3_init_goblin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The goblin initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oGoblin = GetNearestObjectByTag("q3_mangoblin");

    if(GetEnteringObject()== oPC
      && GetIsObjectValid(oGoblin)
      && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        AssignCommand(oPC,ClearAllActions(TRUE));
        DelayCommand(0.5,AssignCommand(oGoblin,ActionStartConversation(oPC)));
    }
}
