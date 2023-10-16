//:://////////////////////////////////////////////////
//:: Q2B_HEN_SPAWN
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Henchman-specific OnSpawn handler for XP1. Based on NW_CH_AC9 by Bioware.
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

    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    // SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);
    // SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);
    // SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);
    // SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);
    // SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);
    // SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);
    //SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT); //Event 1011

    //SetIsDestroyable(FALSE, TRUE, TRUE);
}

