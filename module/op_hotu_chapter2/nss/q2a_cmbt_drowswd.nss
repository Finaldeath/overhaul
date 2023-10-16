//::///////////////////////////////////////////////
//:: Default: End of Combat Round
//:: q2_endcombatrnd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test Combat Round End
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //Do nothing if not the leader
    //if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
        //return;

    //Do nothing if in retreat

    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

    object oGate = GetObjectByTag("q2acitygate");
    if (GetIsObjectValid(oGate) == TRUE && GetLocalInt(OBJECT_SELF, "nOuterGateAttack") == 1)
        return;

    if (GetLocalInt(OBJECT_SELF, "nAttackedTimer") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nAttackedTimer", 1);
        DelayCommand(1.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
        DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "nAttackedTimer", 0));
    }

    object oTarget = GetLastHostileActor();
    //if the target is dead - pick the next nearest target
    if (GetIsDead(oTarget) == TRUE)
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

    ClearAllActions(TRUE);
    if (GetLocalInt(oTarget, "Q2A_OnLedge") == 1)
        ActionEquipMostDamagingRanged();
    else
        ActionEquipMostDamagingMelee();

    //Attack the target
    ActionAttack(oTarget);

}










