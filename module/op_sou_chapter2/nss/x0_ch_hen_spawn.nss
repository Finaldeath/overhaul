//:://////////////////////////////////////////////////
//:: X0_CH_HEN_SPAWN
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
    Henchman-specific OnSpawn handler for XP1. Based
    on NW_CH_AC9 by Bioware. Revised by Rob Bartel to
    handle the experimental Plot Item system in Ch2.
 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 10/09/2002
//:://////////////////////////////////////////////////
#include "x0_inc_henai"

void main()
{
    //Sets up the special henchmen listening patterns
    SetAssociateListenPatterns();

    // Set additional henchman listening patterns
    bkSetListeningPatterns();

    // Default behavior for henchmen at start
    SetAssociateState(NW_ASC_POWER_CASTING);
    SetAssociateState(NW_ASC_HEAL_AT_50);
    SetAssociateState(NW_ASC_RETRY_OPEN_LOCKS);
    SetAssociateState(NW_ASC_DISARM_TRAPS);
    SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, FALSE);
    SetAssociateState(NW_ASC_DISTANCE_2_METERS);

    //Use melee weapons by default
    SetAssociateState(NW_ASC_USE_RANGED_WEAPON, FALSE);

    // Set starting location
    SetAssociateStartLocation();

    // Set respawn location
    SetRespawnLocation();

    // For some general behavior while we don't have a master,
    // let's do some immobile animations
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);

    // ***** CUSTOM USER DEFINED EVENTS ***** /
    /*
      If you uncomment any of these conditions, the creature will fire
      a specific user-defined event number on each event. That will then
      allow you to write custom code in the "OnUserDefinedEvent" handler
      script to go on top of the default NPC behaviors for that event.

      Example: I want to add some custom behavior to my NPC when they
      are damaged. I uncomment the "NW_FLAG_DAMAGED_EVENT", then create
      a new user-defined script that has something like this in it:

      if (GetUserDefinedEventNumber() == 1006) {
          // Custom code for my NPC to execute when it's damaged
      }

      These user-defined events are in the range 1001-1007.
    */

    // * Fire User Defined Event 1001 in the OnHeartbeat
    // *
    // SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);

    // * Fire User Defined Event 1002
    // *
     SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);

    // * Fire User Defined Event 1005
    // *
     SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);

    // * Fire User Defined Event 1006
    // *
     SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);

    // * Fire User Defined Event 1007
    // *
     SetSpawnInCondition(NW_FLAG_DEATH_EVENT);

    // * Fire User Defined Event 1008
    // *
     SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);

    // * Fire User Defined Event 1003
    // *
     SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);

    // * Fire User Defined Event 1004
    // *
     SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);

    // * Fire User Defined OnSpawn (1000)
    SignalEvent(OBJECT_SELF, EventUserDefined(1000));
}

