//::///////////////////////////////////////////////
//:: Name q2d4_ent_dragtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Create Illusionary Dragon
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 13/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "x2_inc_globals"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 2)
        return;
    if (GetGlobalInt("X2_Q2DOvermind") != 0)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", GetLocalInt(OBJECT_SELF, "nTriggered") + 1);
    location lSpawn = GetLocation(GetWaypointByTag("wp_q2d4_dragonspawn"));
    object oDragon = CreateObject(OBJECT_TYPE_CREATURE, "q2d4_illdragon", lSpawn, TRUE);
    AssignCommand(oDragon, DetermineCombatRound());


}
