//::///////////////////////////////////////////////
//:: Name act_q2aord_spec1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have this healer move to the
    Gates.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    object oTarget = GetObjectByTag("wp_bat1priest_courtyard");
    //SetLocalObject(OBJECT_SELF, "oMoveTarget", oTarget);
    DelayCommand(1.0, ActionForceMoveToObject(oTarget, TRUE));

    //DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_MOVE_TO_TARGET)));
}
