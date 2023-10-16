//::///////////////////////////////////////////////
//:: Drow Battle 1: On User Defined
//:: q2a_ud_bat1drow
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
void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == 5000)//ATTEMPTED ADVANCE
    {//The leader will grab all troops in his command and advance to his target
     //Check within a 10 meter radius for enemies - if there are any - attack,
     //Resignal this event in 6 seconds...
        if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
            return;

        //if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
            //return;

        if (GetIsInCombat(OBJECT_SELF) == TRUE)
            return;
        else
            ClearAllActions();
        object oTarget = GetLocalObject(OBJECT_SELF, "oTarget");
        //if we have crossed the target threshhold - all we will do is bash the gate

        if (GetTag(oTarget) == "q2acitygate")
        {

            //SendMessageToPC(GetFirstPC(), "Moving to Outer Gate");
            if (GetLocalInt(OBJECT_SELF, "nOuterGateAttack") == 1)
                return;
            //else
            //    SendMessageToPC(GetFirstPC(), "FAILED");
        }
        else if (GetTag(oTarget) == "q2ainnergate")
        {
            //SendMessageToPC(GetFirstPC(), "Moving to Inner Gate");
            if (GetLocalInt(OBJECT_SELF, "nInnerGateAttack") == 1)
               return;
        }
        //if I have no target for some reason
        else
        {
            //if the city gates are down - advance to courtyard

                object oGate2 = GetObjectByTag("q2ainnergate");
                SetLocalObject(OBJECT_SELF, "oTarget", oGate2);
                DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));

        }

        //Check for enemy (not on a ledge)
        int nEnemy = 1;
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nEnemy, CREATURE_TYPE_IS_ALIVE, TRUE);
        while (oEnemy != OBJECT_INVALID)
        {
            nEnemy++;
            oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nEnemy, CREATURE_TYPE_IS_ALIVE, TRUE);
        }


        int nCount;

        object oCreature;

        string szResRef = GetResRef(OBJECT_SELF);

        int nFormation = GetLocalInt(OBJECT_SELF, "nFormation");

        //check for close by enemies
        if (oEnemy != OBJECT_INVALID && GetDistanceToObject(oEnemy) < 30.0)
        {//Signal all units to attack

            ActionAttack(oEnemy);
            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));

        }
        else
        {
            if (GetDistanceToObject(oTarget) > 5.0)
            {
                //ClearAllActions(TRUE);
                ActionMoveToObject(oTarget, TRUE);

            }
            else
            {   //What to do while waiting??
                // Bash the gates if either of them is your target
                if (GetTag(oTarget) == "q2acitygate" || GetTag(oTarget) == "q2ainnergate")
                {
                    AssignCommand(oCreature, DoDoorAction(oTarget, DOOR_ACTION_BASH));
                    SignalEvent(oCreature, EventUserDefined(5001));

                }
            }
        }

    }
    else if (nEvent == 5001)//Bash Gate
    {
        if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
            return;
        object oGate = GetLocalObject(OBJECT_SELF, "oTarget");
        if (GetIsObjectValid(oGate) == TRUE)
        {
            DoDoorAction(oGate, DOOR_ACTION_BASH);
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(5001)));
        }
        else
        {
            object oGate2 = GetObjectByTag("q2ainnergate");
            SetLocalObject(OBJECT_SELF, "oTarget", oGate2);
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(5001)));
        }
    }
    else if (nEvent == 5002)//Second Advance
    {
        if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
            return;
        object oTarget = GetLocalObject(OBJECT_SELF, "oTarget");
        ActionMoveToObject(oTarget, TRUE);
        DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));
    }
    else if (nEvent == 5003)//Advance to Courtyard
    {
        if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
            return;
        object oGate2 = GetObjectByTag("q2ainnergate");
        SetLocalObject(OBJECT_SELF, "oTarget", oGate2);
        ActionMoveToObject(oGate2, TRUE);
        //DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(5000)));

    }
    else if (nEvent == 5004)//General Retreat
    {
        object oTarget = GetObjectByTag("wp_bat1_retreat");
        ClearAllActions(TRUE);
        DelayCommand(0.2, ActionMoveToObject(GetLocalObject(OBJECT_SELF, "oTarget")));
        DelayCommand(0.4, SetCommandable(FALSE, OBJECT_SELF));
        //DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(5004)));
    }
    return;

}


