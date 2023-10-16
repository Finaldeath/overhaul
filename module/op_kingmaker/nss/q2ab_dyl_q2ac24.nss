//::///////////////////////////////////////////////
//:: q2ab_dyl_q2ac24
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves Dylan, the player and henchmen into the prison
*/
//:://////////////////////////////////////////////
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:: Modified by Cori, August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    os_SetTalkedTo(2);
    object oDest = GetObjectByTag("q2ac24_way_q2ab");
    object oPC = GetFirstPC();
    os_MoveParty(oDest, oPC);
    DelayCommand(1.1,ActionJumpToObject(oDest,FALSE));
}

