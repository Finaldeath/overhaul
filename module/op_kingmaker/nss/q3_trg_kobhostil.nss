//::///////////////////////////////////////////////
//:: Kobolds Hostile
//:: q3_trg_kobhostil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kobolds go hostile to the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "q_include"
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()== oPC
      && GetLocalInt(oPC,"OS_KOBOLD_HONEY")!=10
      && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        q3_KoboldHostile();
    }
}
