//::///////////////////////////////////////////////
//:: Name act_q2aord_forg2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have this cleric move to the Forge.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    object oTarget = GetObjectByTag("bat1_forgetarget");
    SetLocalObject(OBJECT_SELF, "oMoveTarget", oTarget);
    DelayCommand(1.0, ActionForceMoveToObject(oTarget, TRUE, 0.0, 10.0));
    DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_MOVE_TO_TARGET)));

}
