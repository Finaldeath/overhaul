//::///////////////////////////////////////////////
//:: Drow Battle 2: On User Defined
//:: q2a_ud_bat2drow
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == 5000)//ATTEMPTED ADVANCE
    {
        //Check within a 10 meter radius for enemies - if there are any - attack,
        //Resignal this event...
        if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
            return;

        //If in combat - just check back in a while to make sure I'm still in combat
        if (GetIsInCombat(OBJECT_SELF) == TRUE)
        {
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
            return;
        }
        else
            ClearAllActions();

        //this should be set in the spawn of the attacker - should always be the seer for battle 2
        object oTarget = GetLocalObject(OBJECT_SELF, "oTarget");

        //Check for enemy ()
        int nEnemy = 1;
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nEnemy, CREATURE_TYPE_IS_ALIVE, TRUE);

        //check for close by enemies - attack them instead of moving to the seer
        if (GetIsObjectValid(oEnemy) == TRUE && GetDistanceToObject(oEnemy) < 20.0)
        {   //Signal all units to attack- signal the mage to determinecombatround so he casts
            if (GetTag(OBJECT_SELF) == "q2a_bat2_duer3")
                DetermineCombatRound();
            else
                ActionAttack(oEnemy);

            //rinse and repeat...always repeat
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
        }
        else
        {
            //while the Seer is valid - move to her if far away or attack her if close
            if (GetIsObjectValid(oTarget) == TRUE)
            {
                if (GetDistanceToObject(oTarget) > 15.0)
                {
                    ActionMoveToObject(oTarget, TRUE);
                    DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
                }
                else
                {
                    ActionAttack(oTarget);
                }
            }
        }

    }
    return;

}


