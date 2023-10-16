//::///////////////////////////////////////////////
//:: act_gate_spirit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes the player's xp and destroys a minion
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oMinion = GetNearestObjectByTag("NW_VAMPIRE");
    int nXP = GetXP(oPC)-1000;
    SetXP(oPC,nXP);
    DestroyObject(oMinion);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,250);
    }
}
