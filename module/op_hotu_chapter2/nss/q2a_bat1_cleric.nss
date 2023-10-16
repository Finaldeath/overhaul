//::///////////////////////////////////////////////
//:: Name q2a_bat1_cleric
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

//Check the nearest 3 Friendly NPCs and if one is hurt - heal them.
object GetHealTarget();
void HealNPC(object oTarget);
void main()
{
   object oPC = GetFirstPC();
   int nUser = GetUserDefinedEventNumber();

    if(nUser == UNIT_MOVE_TO_TARGET )
    {
        //if this unit is not fighting
        if (GetIsInCombat() == TRUE)
        {
            return;
        }
        //if the unit is speaking with the PC
        if (IsInConversation(OBJECT_SELF) == TRUE)
        {
            DelayCommand(6.0, SignalEvent(OBJECT_SELF , EventUserDefined(UNIT_MOVE_TO_TARGET)));

            return;
        }

        //Move the unit to its target.
        object oTarget = GetLocalObject(OBJECT_SELF, "oMoveTarget");
        if (GetDistanceToObject(oTarget) > 3.0)
        {
            ActionMoveToObject(oTarget, TRUE);
            DelayCommand(3.0, SignalEvent(OBJECT_SELF , EventUserDefined(UNIT_MOVE_TO_TARGET)));
        }
        else
        {
            ClearAllActions();
            SetLocalObject(OBJECT_SELF, "oMoveTarget", OBJECT_INVALID);
            DelayCommand(3.0, SignalEvent(OBJECT_SELF, EventUserDefined(HEALER_ORDER_HEAL_REBELS)));
        }
    }

    else if (nUser == HEALER_ORDER_HEAL_REBELS)
    {
        //if this unit is not fighting

        if (GetIsInCombat() == TRUE)
            return;

        if (IsInConversation(OBJECT_SELF) == TRUE)
            return;

        //Only heal if not ordered elsewhere.
        if (GetLocalObject(OBJECT_SELF, "oMoveTarget") == OBJECT_INVALID)
        {
            object oTarget = GetHealTarget();
            if (GetIsObjectValid(oTarget) == TRUE)
            {
                HealNPC(oTarget);
                DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(HEALER_ORDER_HEAL_REBELS)));
            }
            else
            {
                DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(HEALER_ORDER_HEAL_REBELS)));
            }
        }
    }

}

//Check the nearest 3 Friendly NPCs and if one is hurt - heal them.
object GetHealTarget()
{
    object oTarget = OBJECT_INVALID;
    object oFriend;
    int bTargetFound = FALSE;
    int nCount;
    for (nCount = 1; nCount < 4 && bTargetFound == FALSE; nCount++)
    {
        oFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nCount);
        if (GetIsObjectValid(oFriend) == TRUE)
        {
            if (GetCurrentHitPoints(oFriend) < GetMaxHitPoints(oFriend))
            {
                oTarget = oFriend;
                bTargetFound = TRUE;
            }
        }
        else
        {
            nCount = 5;
        }
    }

    return oTarget;
}

void HealNPC(object oTarget)
{
    ActionCastSpellAtObject(SPELL_CURE_SERIOUS_WOUNDS, oTarget, METAMAGIC_ANY, TRUE);
}

