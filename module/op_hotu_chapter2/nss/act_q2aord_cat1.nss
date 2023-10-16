//::///////////////////////////////////////////////
//:: Name act_q2aord_cat1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have this unit order his troops to move to the
    Catapult 1 emplacement.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    object oTarget = GetObjectByTag("bat1_catapult1target");
    SetLocalObject(OBJECT_SELF, "oMoveTarget", oTarget);
    DelayCommand(1.0, ActionForceMoveToObject(oTarget, TRUE, 0.0, 10.0));
    SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_FOLLOW_LEADER));
}
