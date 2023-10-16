//::///////////////////////////////////////////////
//:: Default On Attacked
//:: NW_C2_DEFAULT5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "nw_i0_generic"
int GetIsInTrigger(object oTrigger, object oCreature);
void main()
{
    if(GetFleeToExit())
    {
        // Run away!
        ActivateFleeToExit();
    }
    else if (GetSpawnInCondition(NW_FLAG_SET_WARNINGS))
    {
        // We give an attacker one warning before we attack
        // This is not fully implemented yet
        SetSpawnInCondition(NW_FLAG_SET_WARNINGS, FALSE);

        //Put a check in to see if this attacker was the last attacker
        //Possibly change the GetNPCWarning function to make the check
    }
    else
    {
        object oAttacker = GetLastAttacker();


        if(GetLocalInt(OBJECT_SELF, "nAttacked") != 1)
        {
            object oPC = GetLastHostileActor();
            object oCage = GetObjectByTag("q1rumgut_range_trigger");
            if (GetIsInTrigger(oCage, oPC) == TRUE)
            {
                //SendMessageToPC(GetFirstPC(), "Should be destroying cage");
                SetLocalInt(OBJECT_SELF, "nAttacked", 1);
                object oDoor1 = GetObjectByTag("q1rumgutcage1");
                object oDoor2 = GetObjectByTag("q1rumgutcage2");
                object oDoor3 = GetObjectByTag("q1rumgutcage3");
                object oDoor4 = GetObjectByTag("q1rumgutcage4");
                object oDoor5 = GetObjectByTag("q1rumgutcage5");
                object oDoor6 = GetObjectByTag("q1rumgutcage6");
                object oDoor7 = GetObjectByTag("q1rumgutcage7");
                SetPlotFlag(oDoor1, FALSE);
                SetPlotFlag(oDoor2, FALSE);
                SetPlotFlag(oDoor3, FALSE);
                SetPlotFlag(oDoor4, FALSE);
                SetPlotFlag(oDoor5, FALSE);
                SetPlotFlag(oDoor6, FALSE);
                SetPlotFlag(oDoor7, FALSE);
                effect eDamage = EffectDamage(10);
                AssignCommand(OBJECT_SELF, ActionAttack(oDoor4));

                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor1));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor2));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor3));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor4));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor5));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor6));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor7));

                //Move rebecca out of the way
                object oRebecca = GetObjectByTag("q1ruralrebecca");
                object oExit = GetWaypointByTag("wp_q1rumcave_exit");
                AssignCommand(oRebecca, ActionMoveToObject(oExit, TRUE, 5.0));
            }
        }
        if (!GetIsObjectValid(oAttacker)) {
            // Don't do anything, invalid attacker

        } else if (!GetIsFighting(OBJECT_SELF)) {
            // We're not fighting anyone else, so
            // start fighting the attacker
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                SetSummonHelpIfAttacked();
                DetermineSpecialBehavior(oAttacker);
            } else if (GetArea(oAttacker) == GetArea(OBJECT_SELF)) {
                SetSummonHelpIfAttacked();
                DetermineCombatRound(oAttacker);
            }

            //Shout Attack my target, only works with the On Spawn In setup
            SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

            //Shout that I was attacked
            SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
        }
    }

    if(GetSpawnInCondition(NW_FLAG_ATTACK_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_ATTACKED));
    }
}
int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}
