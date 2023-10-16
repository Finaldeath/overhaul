//::///////////////////////////////////////////////
//:: Goblin Chief Initiates
//:: q3_init_gchief
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Goblin chief initiates with the player
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

        object oChief = GetObjectByTag("q3_goblin_chief");

        if (GetIsDead(oChief) == FALSE)
        {
            DelayCommand(0.5,AssignCommand(oChief,SpeakOneLinerConversation()));
        }
    }
}
