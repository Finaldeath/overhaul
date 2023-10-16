//::///////////////////////////////////////////////
//:: act_gate_pain
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Damages the player and destroys a minion
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    int nHit = GetCurrentHitPoints(oPC)/3;
    effect eDam = EffectDamage(nHit);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oPC);
    object oMinion = GetNearestObjectByTag("NW_DUEFIGHT010");
    DestroyObject(oMinion);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,250);
    }
}
