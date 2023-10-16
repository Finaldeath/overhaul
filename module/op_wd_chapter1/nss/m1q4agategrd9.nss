//::///////////////////////////////////////////////
//:: Generic: On Spawn In
//:: File Name:
//:: Module:
//:: NPC:
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    after having just been spawned in
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    //This Spawn in script is meant to be customized by commenting out and various function
    //calls.  Each function call below can be used to change the behavior of a particular
    //creature.  Some of the function calls should be left in because they work automatically
    //with how your module is set up.

// OPTIONAL BEHAVIORS (Comment In or Out to Activate ) ****************************************************************************

    //SetSpecialConversationStart();  // A flag is set on a script telling the conversation that a particular special
                                      // one-off conversation can be used.

    //SetAttackMyTarget();      // This will set the listening pattern on the NPC to attack when allies call

    //StealthActivate();        // If the NPC has stealth and they are a rogue go into stealth mode

    //SearchActivate();         // If the NPC has Search go into Search Mode

    //SetNPCWarningStatus();    // This will set the NPC to give a warning to non-enemies before attacking

    // NOTE: ONLY ONE OF THE FOLOOWING ESCAPE COMMANDS SHOULD EVER BE ACTIVATED AT ANY ONE TIME.

    //SetEscapeAndReturn();     // OPTIONAL BEHAVIOR (Flee to a way point and return a short time later.)
    //SetEscapeAndLeave();      // OPTIONAL BEHAVIOR (Flee to a way point and do not return.)
    //SetTeleportAndLeave();    // OPTIONAL BEHAVIOR (Teleport to safety and do not return.)
    //SetTeleportAndReturn();   // OPTIONAL BEHAVIOR (Teleport to safety and return a short time later.)

                               // For all of these to work a Waypoint must exist in the world with the naming
                               // convention "EXIT_" + NPC Tag
                               // Even the teleport versions use this to specify that the flee should work.  This
                               // is to avoid unnecessary code in the script sets themselves.

// DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) *****************************************************************************************
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Looks to see if any Way Points in the module have the tag WP_ + NPC TAG + _0X, if so walk them
}

