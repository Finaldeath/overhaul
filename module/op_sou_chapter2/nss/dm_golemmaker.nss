//::///////////////////////////////////////////////
//:: Golem-Maker's Tomb (OnDamaged)
//:: Dm_GolemMaker.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Turn the Stone Butler hostile
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    object oButler = GetNearestObjectByTag("StoneButler");
    ChangeToStandardFaction(oButler, STANDARD_FACTION_HOSTILE);
    AssignCommand(oButler, DetermineCombatRound());
}
