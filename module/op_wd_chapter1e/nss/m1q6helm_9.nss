//::///////////////////////////////////////////////
//:: Custom On Spawn In
//:: File Name
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"

void main()
{
    SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);           //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1006
    SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT);
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature
}

