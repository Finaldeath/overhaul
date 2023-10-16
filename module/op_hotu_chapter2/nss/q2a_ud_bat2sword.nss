//::///////////////////////////////////////////////
//:: Name q2a_ud_bat2sword
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Siege Sword Troops - User Defined.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == UNIT_MOVE_TO_TARGET )
    {
        //if this unit is not fighting
        //only move if this unit is not fighting
        if (GetIsInCombat() == TRUE)
        {
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_MOVE_TO_TARGET)));
            return;
        }
        //if the unit is speaking with the PC
        if (IsInConversation(OBJECT_SELF) == TRUE)
        {
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_MOVE_TO_TARGET)));
            return;
        }
        //Move the unit to its target.
        object oTarget = GetLocalObject(OBJECT_SELF, "oMoveTarget");
        if (GetIsObjectValid(oTarget) == TRUE)
        {
            //if we are farther than 5 meters from our target
            if (GetDistanceToObject(oTarget) > 5.0)
            {
                //Check for enemies
                object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
                if (GetDistanceToObject(oEnemy) < 20.0)
                {
                    ClearAllActions();
                    ActionAttack(oEnemy, TRUE);
                    DelayCommand(18.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));
                }
                else
                {
                    ActionForceMoveToObject(oTarget, TRUE, 1.0, 5.0);
                    DelayCommand(6.0, SignalEvent(OBJECT_SELF , EventUserDefined(UNIT_MOVE_TO_TARGET)));
                }
            }
            else
            {
                ClearAllActions();
                object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
                if (GetDistanceToObject(oEnemy) < 20.0)
                    ActionAttack(oEnemy);
                else
                {
                    SetLocalObject(OBJECT_SELF, "oMoveTarget", OBJECT_INVALID);
                    DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));
                }
            }
        }
    }
    else if (nUser == LEADER_ORDER_FOLLOW_LEADER)
    {
        //Have the leader get all his troops and order them to move to the leader's target
        object oTarget = GetLocalObject(OBJECT_SELF, "oMoveTarget");
        BattleOrder_MoveTroopsToTarget(oTarget);

    }
    else if (nUser == UNIT_ORDER_MAKE_ME_LEADER)
    {
        //The old leader had died - when this unit is out of combat - change into leader clothes
        //FOR NOW - JUST CHANGE RIGHT AWAY
        ClearAllActions(TRUE);
        effect eVis = EffectVisualEffect(VFX_DUR_FLAG_GOLD);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
        object oHelm = CreateItemOnObject("q2arebleadhelm");
        SetDroppableFlag(oHelm, FALSE);
        ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD);
        DetermineCombatRound();
    }
    else if (nUser == UNIT_ORDER_PATROL_CURRENT_LOCATION)
    {
        //if this unit is not fighting
        if (GetIsInCombat() == TRUE)
            return;

        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        if (GetDistanceToObject(oEnemy) < 20.0)
            ActionAttack(oEnemy);
        else
        {
        //Have the Leader check for enemies
        //if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
        //{
        //    DelayCommand(0.5, SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES)));
        //}
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));


            if (GetLocalInt(OBJECT_SELF, "nFirstOrders") == 0)
                return;


            //Only patrol if not ordered elsewhere.
            if (GetLocalObject(OBJECT_SELF, "oMoveTarget") == OBJECT_INVALID)
            {
                if (Random(2) == 1)
                {
                    object oTarget = GetNearestObjectByTag("wp_bat2patrol", OBJECT_SELF, 2);
                    ActionMoveToObject(oTarget, FALSE);
                }
                else
                {
                    ClearAllActions();

                }
            }
        }
    }
    else if (nUser == UNIT_ORDER_STAND_POST)
    {
        object oEnemy = GetNearestEnemy();
        //if the leader can see the enemy - signal for units to attack
        if (GetObjectSeen(oEnemy, OBJECT_SELF) == TRUE)
        {
            ActionAttack(oEnemy);
        }
        else
        {
            ClearAllActions(TRUE);
            string szNumber = GetStringRight(GetTag(OBJECT_SELF), 1);
            object oPost = GetWaypointByTag("wp_bat2seerpost" + szNumber);
            //check for enemies every 6 seconds
            if(GetDistanceToObject(oPost) > 4.0)
                ActionMoveToObject(oPost, TRUE);
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_STAND_POST)));
        }
    }
    else if (nUser == LEADER_ORDER_CHECK_FOR_ENEMIES)
    {
        object oEnemy = GetNearestEnemy();
        //if the leader can see the enemy - signal for units to attack
        if (GetObjectSeen(oEnemy, OBJECT_SELF) == TRUE)
        {
            //if the gates are still standing - do nothing
           //object oGate = GetObjectByTag("q2acitygate");
           // if (GetIsObjectValid(oGate) == TRUE)
           //     return;

            BattleOrder_FormationAttack(oEnemy);
        }
        else
        {
            ClearAllActions();
            //Have the Leader check for enemies every 6 seconds
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES)));
        }


    }
    else if (nUser == UNIT_ORDER_PATROL_TOWER)
    {
        //if this unit is not fighting
        if (GetLocalInt(OBJECT_SELF, "nEngageEnemy") == 1)
            return;

        if (GetIsInCombat() == TRUE)
            return;

        if (GetLocalInt(OBJECT_SELF, "nFirstOrders") == 0)
            return;

        //Have the Leader check for enemies
        if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
        {
            DelayCommand(0.5, SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES)));
        }
        //Only patrol if not ordered elsewhere.
        if (GetLocalObject(OBJECT_SELF, "oMoveTarget") == OBJECT_INVALID)
        {
            if (Random(2) == 1)
            {
                object oTarget = GetNearestObjectByTag("wp_bat1patrol" + IntToString(Random(2)+ 1));
                ActionMoveToObject(oTarget, FALSE);
                DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));
            }
            else
            {
                ClearAllActions();
                DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));

            }
        }
    }
}


