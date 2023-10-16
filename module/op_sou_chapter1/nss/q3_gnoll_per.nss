//:://////////////////////////////////////////////////
//:: q3_gnoll_per
/*
  Gnoll perceive event:
  same as default except that goes for the nearest alarm gong and uses it.
  Notice: A gnoll will not go to use a gong if another gnoll is already on his way.
 */
//:://////////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 25/2/2003
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    object oPercep = GetLastPerceived();
    int bSeen = GetLastPerceptionSeen();

    // This will cause the NPC to speak their one-liner
    // conversation on perception even if they are already
    // in combat.
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION)
       && GetIsPC(oPercep)
       && bSeen)
    {
        SpeakOneLinerConversation();
    }

    // This section has been heavily revised while keeping the
    // pre-existing behavior:
    // - If we're in combat, keep fighting.
    // - If not and we've perceived an enemy, start to fight.
    //   Even if the perception event was a 'vanish', that's
    //   still what we do anyway, since that will keep us
    //   fighting any visible targets.
    // - If we're not in combat and haven't perceived an enemy,
    //   see if the perception target is a PC and if we should
    //   speak our attention-getting one-liner.
    if (GetIsFighting(OBJECT_SELF)) {
        // don't do anything else, we're busy
        MyPrintString("GetIsFighting: TRUE");

    }
    // * BK FEB 2003 Only fight if you can see them. DO NOT RELY ON HEARING FOR ENEMY DETECTION
    else if (GetIsEnemy(oPercep) && bSeen) {
        MyPrintString("GetIsEnemy: TRUE");
        // We spotted an enemy and we're not already fighting
        if(!GetHasEffect(EFFECT_TYPE_SLEEP)) {
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                MyPrintString("DetermineSpecialBehavior");
                DetermineSpecialBehavior();
            } else {
                MyPrintString("DetermineCombatRound");
                SetFacingPoint(GetPosition(oPercep));
                SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                object oGong = GetNearestObjectByTag("Q3_GNOLL_ALARM_GONG");
                int nGuard = GetLocalInt(OBJECT_SELF, "Q3_GUARD"); // guards at chief hall don't go for alarm
                if(nGuard ==1 || oGong == OBJECT_INVALID)
                {
                    DetermineCombatRound();
                    return;
                }
                int nSomeoneIsGoing = GetLocalInt(oGong, "Q3_GOING_TO_GONG");
                if(nSomeoneIsGoing == 1) // no need to send 2 or more gnolls to the same gong...
                {
                    DetermineCombatRound();
                    return;
                }
                // now checking whether this gnoll is already responding to a previous alarm
                int nAlarmed = GetLocalInt(OBJECT_SELF, "Q3_ALARMED_GNOLL");
                if(nAlarmed)
                {
                    DetermineCombatRound();
                    return;
                }
                SetLocalInt(oGong, "Q3_GOING_TO_GONG", 1); // this gong is mine!
                ClearAllActions();   //used to be 40281
                ActionSpeakStringByStrRef(29338);
                ActionMoveToObject(oGong, TRUE, 0.0);
                ActionDoCommand(SignalEvent(oGong, EventUserDefined(101)));
                ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
                //ActionDoCommand(DetermineCombatRound());
                ActionAttack(GetLastPerceived());
            }
        }
    } else {
        if (bSeen) {
            MyPrintString("GetLastPerceptionSeen: TRUE");
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                DetermineSpecialBehavior();
            } else if (GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION)
                       && GetIsPC(oPercep))
            {
                // The NPC will speak their one-liner conversation
                // This should probably be:
                // SpeakOneLinerConversation(oPercep);
                // instead, but leaving it as is for now.
                ActionStartConversation(OBJECT_SELF);
            }
        }

        // activate ambient animations or walk waypoints if appropriate
       if (!IsInConversation(OBJECT_SELF)) {
           if (GetIsPostOrWalking()) {
               WalkWayPoints();
           } else if (GetIsPC(oPercep) &&
               (GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS)
                || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN)
                || GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS)
                || GetIsEncounterCreature()))
           {
                SetAnimationCondition(NW_ANIM_FLAG_IS_ACTIVE);
           }
        }
    }

    // Send the user-defined event if appropriate
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_PERCEIVE));
    }
}




