//:://////////////////////////////////////////////////
//:: q2_ondamage
//:: Default OnDamaged handler
/*
    On Damaged
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{

    //if we are already in combat - we shouldn't have to do anything else because
        //then end of combat round script should fire...
        if (GetIsInCombat() == TRUE)
            return;

    //Do nothing if in retreat
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
        return;

    object oGate = GetObjectByTag("q2acitygate");
    if (GetIsObjectValid(oGate) == TRUE && GetLocalInt(OBJECT_SELF, "nOuterGateAttack") == 1)
        return;

    //Undead are just going to attack - not worry about the inner gate..
    //if (GetStringLeft(GetTag(OBJECT_SELF), 8) != "q2a_bat1")
    //{//Do nothing if not the leader
    //    if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
    //        return;
    //}



        if (GetLocalInt(OBJECT_SELF, "nAttackedTimer") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nAttackedTimer", 1);
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
            DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "nAttackedTimer", 0));
            return;
        }

        object oTarget = GetLastDamager();

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

