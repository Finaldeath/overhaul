//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q2_onattacked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    //Do nothing if not the leader
    //if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
    //    return;
    //if we are already in combat - the end of combat script should fire - so do nothing
    if (GetIsInCombat() == TRUE)
        return;

    //Do nothing if in retreat
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

    object oGate = GetObjectByTag("q2acitygate");
    if (GetIsObjectValid(oGate) == TRUE && GetLocalInt(OBJECT_SELF, "nOuterGateAttack") == 1)
        return;

        object oTarget = GetLastAttacker();

        if (GetLocalInt(OBJECT_SELF, "nAttackedTimer") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nAttackedTimer", 1);
            SignalEvent(OBJECT_SELF, EventUserDefined(5000));
            DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "nAttackedTimer", 0));
        }

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

