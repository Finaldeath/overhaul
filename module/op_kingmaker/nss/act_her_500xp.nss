//::///////////////////////////////////////////////
//:: act_her_500xp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gives the PC 500 xp
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,500);
    }
}
