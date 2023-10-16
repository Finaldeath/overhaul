//:://////////////////////////////////////////////////
//:: q2c_spn_nathyrra
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

    // * Setup how many random interjectiosn and popups they have
    SetNumberOfRandom("X2_L_RANDOMONELINERS", OBJECT_SELF, 25);
    SetNumberOfRandom("X2_L_RANDOM_INTERJECTIONS", OBJECT_SELF, 10);

    //Sets up the special henchmen listening patterns
    SetAssociateListenPatterns();

    // Set additional henchman listening patterns
    bkSetListeningPatterns();

    // Default behavior for henchmen at start
    SetAssociateState(NW_ASC_POWER_CASTING);
    SetAssociateState(NW_ASC_HEAL_AT_50);
    SetAssociateState(NW_ASC_RETRY_OPEN_LOCKS);
    SetAssociateState(NW_ASC_DISARM_TRAPS);

    // * July 2003. Set this to true so henchmen
    // * will hopefully run off a little less often
    // * by default
    SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, TRUE);
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

    SetIsDestroyable(FALSE);


}

