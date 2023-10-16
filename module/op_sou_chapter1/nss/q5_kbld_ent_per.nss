//:://////////////////////////////////////////////////
//:: q5_kbld_ent_per
/*
  Kobolds call for help at entrance.

   Whenever a player steps on the encounter trigger - both kobolds scream, and start
    running to the guardroom. When they reach it, all the guards get into the room.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 13/2/2003
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void BringKobolds(object oKobold)
{
    // make sure the call for help is done only once
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_ENTRANCE_ONCE");
    if(nDoOnce == 1)
      return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_ENTRANCE_ONCE", 1);

    int n = 1;
    object oHelp = GetNearestObjectByTag("Q5_KOBOLD", oKobold, n);
    while(oHelp != OBJECT_INVALID)
    {
        n++;
        if(GetDistanceBetween(oKobold, oHelp) > 35.0)
            return;

        if(GetIsInCombat(oHelp))
            continue;
        SignalEvent(oHelp, EventUserDefined(101));
        oHelp = GetNearestObjectByTag("Q5_KOBOLD", oKobold, n);
    }
}

void CallForHelp(object oPC)
{
    object oWP1 = GetWaypointByTag("Q5_WP_KOBOLD_ENTRANCE1");
    object oWP2 = GetWaypointByTag("Q5_WP_KOBOLD_ENTRANCE2");
    object oWP3 = GetWaypointByTag("Q5_WP_KOBOLD_ENTRANCE3");
    ClearAllActions();
    ActionMoveToObject(oWP1, TRUE);
    ActionMoveToObject(oWP2, TRUE);
    ActionDoCommand(BringKobolds(OBJECT_SELF));
    if(GetTag(OBJECT_SELF) == "Q5_KOBOLD_ENTRANCE1")
            ActionSpeakStringByStrRef(40275);
        else
            ActionSpeakStringByStrRef(40276);
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 0.5, 1.0);
    ActionMoveToObject(oWP3, TRUE);
    ActionDoCommand(DetermineCombatRound());
}

void main()
{
    object oPercep = GetLastPerceived();
    int bSeen = GetLastPerceptionSeen();

    if (GetIsEnemy(oPercep) && bSeen)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
        {
                    // March 5 2003 Brent
            // Had to add this section back in, since Naomi's modifications were not taking this specific
            // example into account -- it made invisibility basically useless.
            //If the last perception event was hearing based or if someone vanished then go to search mode
            if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
            {
                object oGone = GetLastPerceived();
                if((GetAttemptedAttackTarget() == GetLastPerceived() ||
                   GetAttemptedSpellTarget() == GetLastPerceived() ||
                   GetAttackTarget() == GetLastPerceived()) && GetArea(GetLastPerceived()) != GetArea(OBJECT_SELF))
                {
                    //SpeakString("dude...like disappeared.");
                   ClearAllActions();
                   DetermineCombatRound();
                }
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
                        DetermineCombatRound();
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
            return;
        }

        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        if(GetTag(OBJECT_SELF) == "Q5_KOBOLD_ENTRANCE1")
            SpeakStringByStrRef(40276);
        else
            SpeakStringByStrRef(40277);
        CallForHelp(oPercep);

    }
}




