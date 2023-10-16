//::///////////////////////////////////////////////
//:: Name q2a_ent_ritowtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the enterer has this area as his move target,
    jump him upstairs.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    object oCreature = GetEnteringObject();
    SetLocalInt(oCreature, "Q2A_OnLedge", 0);
    object oTarget = GetObjectByTag("bat1_innertowerrighttarget");
    if (GetLocalObject(oCreature, "oMoveTarget") == oTarget)
    {
        SetLocalObject(oCreature, "oMoveTarget", OBJECT_INVALID);
        object oJumpTarget = GetWaypointByTag("wp_q2ainnertowerright");
        AssignCommand(oCreature, ClearAllActions());
        AssignCommand(oCreature, JumpToObject(oJumpTarget));
        DelayCommand(1.0, SignalEvent(oCreature, EventUserDefined(UNIT_ORDER_PATROL_TOWER)));
    }
}
