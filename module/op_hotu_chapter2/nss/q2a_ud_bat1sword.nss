//::///////////////////////////////////////////////
//:: Name q2a_bat1_ud1
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
            if (GetDistanceToObject(oTarget) > 3.0)
            {
                ActionMoveToObject(oTarget, TRUE);
                DelayCommand(7.0, SignalEvent(OBJECT_SELF , EventUserDefined(UNIT_MOVE_TO_TARGET)));
            }
            else
            {
                ClearAllActions();

                int nAnimation;
                int nRandom = Random(7);
                switch (nRandom)
                {
                    case 0: nAnimation = ANIMATION_LOOPING_TALK_FORCEFUL;
                            break;
                    case 1: nAnimation = ANIMATION_LOOPING_TALK_LAUGHING;
                            break;
                    case 2: nAnimation = ANIMATION_LOOPING_TALK_NORMAL;
                            break;
                    case 3: nAnimation = ANIMATION_LOOPING_LOOK_FAR;
                            break;
                    case 4: nAnimation = ANIMATION_LOOPING_LISTEN;
                            break;
                    case 5: nAnimation = ANIMATION_FIREFORGET_SALUTE;
                            break;
                    case 6: nAnimation = ANIMATION_FIREFORGET_SALUTE;
                            break;

                }
                ActionPlayAnimation(nAnimation, 1.0, 3.0);
                SetLocalObject(OBJECT_SELF, "oMoveTarget", OBJECT_INVALID);
                DelayCommand(3.5, SignalEvent(OBJECT_SELF, EventUserDefined(UNIT_ORDER_PATROL_CURRENT_LOCATION)));
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
        DelayCommand(0.5, SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES)));

    }
    else if (nUser == UNIT_ORDER_PATROL_CURRENT_LOCATION)
    {
        //if this unit is not fighting
        if (GetIsInCombat() == TRUE)
            return;

        //Have the Leader check for enemies
        //if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
        //{
            DelayCommand(0.5, SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES)));
        //}

        if (GetLocalInt(OBJECT_SELF, "nFirstOrders") == 0)
            return;


        //Only patrol if not ordered elsewhere.
        if (GetLocalObject(OBJECT_SELF, "oMoveTarget") == OBJECT_INVALID)
        {
            if (Random(2) == 1)
            {
                object oTarget = GetNearestObjectByTag("wp_bat1patrol" + IntToString(Random(5)+ 1));
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
    else if (nUser == LEADER_ORDER_CHECK_FOR_ENEMIES)
    {
        object oEnemy = GetNearestEnemy();
        //if the leader can see the enemy - signal for units to attack
        if (GetDistanceToObject(oEnemy) < 35.0)
        {
           //if the front gate isn't down yet - do nothing unless we were damaged
            //by an outsider - this should prevent us rushing the gate when hit by arrows
            if (GetLocalInt(GetModule(), "X2_Q2ABattle1_Gate1Open") == 0)
            {
                if (GetRacialType(oEnemy) != RACIAL_TYPE_OUTSIDER)
                    return;
            }
            ActionAttack(oEnemy);
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES)));

            //BattleOrder_FormationAttack(oEnemy);
        }
        else
        {
            //ClearAllActions();
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


