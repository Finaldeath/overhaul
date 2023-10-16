//::///////////////////////////////////////////////
//:: act_gate_riches
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes the player's gold and destroys a minion
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oMinion = GetNearestObjectByTag("NW_OGRECHIEF01");
    TakeGoldFromCreature(1000,oPC,TRUE);
    DestroyObject(oMinion);
}
