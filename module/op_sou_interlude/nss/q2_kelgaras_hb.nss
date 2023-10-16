//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT1
/*
  Default OnHeartbeat script for NPCs.

  This script causes NPCs to perform default animations
  while not otherwise engaged.

  This script duplicates the behavior of the default
  script and just cleans up the code and removes
  redundant conditional checks.

 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    if(GetLocalInt(OBJECT_SELF, "Q2_IGNORE_DEFAULT_AI") == 1)
    {
        return;
    }
    // * if not runnning normal or better Ai then exit for performance reasons
    if (GetAILevel() == AI_LEVEL_VERY_LOW) return;

    // handle hiding player - count rounds not in combat, and if getting 2 consecutive rounds
    // like this - go to the last location that someone had been seen
    int nInCombat = GetLocalInt(OBJECT_SELF, "IN_COMBAT");
    if(GetLocalInt(OBJECT_SELF, "COMBAT_STARTED") == 1)
    {
        if(!GetIsInCombat())
        {
            nInCombat++;
            SetLocalInt(OBJECT_SELF, "IN_COMBAT", nInCombat);
            if(nInCombat == 3)
            {
                SetLocalInt(OBJECT_SELF, "IN_COMBAT", 0);
                object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                object oWP = GetNearestObjectByTag("Q2E_WP_KELGARAS_JUMP", oPC);
                effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
                location lLoc = GetLocation(oWP);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
                DelayCommand(0.3, SetFacingPoint(GetPosition(oPC)));
                DelayCommand(0.4, JumpToLocation(lLoc));
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));


            }
        }
        else // in combat
        {
            SetLocalInt(OBJECT_SELF, "IN_COMBAT", 0);
        }
    }

    // Buff ourselves up right away if we should
    if(GetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY))
    {
        // This will return TRUE if an enemy was within 40.0 m
        // and we buffed ourselves up instantly to respond --
        // simulates a spellcaster with protections enabled
        // already.
        if(TalentAdvancedBuff(40.0))
        {
            // This is a one-shot deal
            SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY, FALSE);

            // This return means we skip sending the user-defined
            // heartbeat signal in this one case.
            return;
        }
    }


    if(GetHasEffect(EFFECT_TYPE_SLEEP))
    {
        // If we're asleep and this is the result of sleeping
        // at night, apply the floating 'z's visual effect
        // every so often

        if(GetSpawnInCondition(NW_FLAG_SLEEPING_AT_NIGHT))
        {
            effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
            if(d10() > 6)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
            }
        }
    }

    // If we have the 'constant' waypoints flag set, walk to the next
    // waypoint.
    else if ( GetWalkCondition(NW_WALK_FLAG_CONSTANT) )
    {
        WalkWayPoints();
    }

    // Check to see if we should be playing default animations
    // - make sure we don't have any current targets
    else if ( !GetIsObjectValid(GetAttemptedAttackTarget())
          && !GetIsObjectValid(GetAttemptedSpellTarget())
          // && !GetIsPostOrWalking())
          && !GetIsObjectValid(GetNearestSeenEnemy()))
    {
        if (GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL) || GetBehaviorState(NW_FLAG_BEHAVIOR_OMNIVORE) ||
            GetBehaviorState(NW_FLAG_BEHAVIOR_HERBIVORE))
        {
            // This handles special attacking/fleeing behavior
            // for omnivores & herbivores.
            DetermineSpecialBehavior();
        }
        else if (!IsInConversation(OBJECT_SELF))
        {
            if (GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS)
                || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN)
                || GetIsEncounterCreature())
            {
                PlayMobileAmbientAnimations();
            }
            else if (GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS))
            {
                PlayImmobileAmbientAnimations();
            }
        }
    }

    // Send the user-defined event signal if specified
    if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_HEARTBEAT));
    }
}

