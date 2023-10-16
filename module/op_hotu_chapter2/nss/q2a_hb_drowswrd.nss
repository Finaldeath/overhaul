//::///////////////////////////////////////////////
//:: Name q2a_hb_drowswrd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default Heartbeat script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void PickTarget();
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
    {
        //("Squad Leader");
        if (GetLocalInt(OBJECT_SELF, "nTargetPicked") == 1)
            return;
        object oGate = GetObjectByTag("q2acitygate");
        if (GetIsObjectValid(oGate) == TRUE)
            return;

        PickTarget();
    }
}

void PickTarget()
{
    object oPC = GetFirstPC();
    object oTarget;
    switch (Random(2) + 1)
    {
        case 1: oTarget = GetObjectByTag("bat1_catapult1target");
            break;
        case 2: oTarget = GetObjectByTag("bat1_forgetarget");
            break;

    }
    SetLocalObject(OBJECT_SELF, "oMoveTarget", oTarget);
    SetLocalInt(OBJECT_SELF, "nTargetPicked", 1);
    ActionMoveToObject(oTarget, TRUE);
    SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_FOLLOW_LEADER));

}


