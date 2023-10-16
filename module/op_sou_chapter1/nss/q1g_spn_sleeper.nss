//:://////////////////////////////////////////////////
//:: q1g_spn_sleeper
/*
 * Default OnSpawn handler with XP1 revisions.
 * This corresponds to and produces the same results
 * as the default OnSpawn handler in the OC.
 *
 * This can be used to customize creature behavior in three main ways:
 *
 * - Uncomment the existing lines of code to activate certain
 *   common desired behaviors from the moment when the creature
 *   spawns in.
 *
 * - Uncomment the user-defined event signals to cause the
 *   creature to fire events that you can then handle with
 *   a custom OnUserDefined event handler script.
 *
 * - Add new code _at the end_ to alter the initial
 *   behavior in a more customized way.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/11/2002
//:://////////////////////////////////////////////////

//#include "x0_i0_anims"
#include "x0_i0_walkway"
//#include "x0_i0_treasure"

void main()
{




    // * Fire User Defined Event 1001 in the OnHeartbeat
    // *
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    //SetSpawnInCondition(NW_FLAG_DEATH_EVENT);
    SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT);


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //

}


