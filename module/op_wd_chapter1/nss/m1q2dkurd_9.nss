#include "NW_I0_GENERIC"

void main()
{
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1002
    //SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);           //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);          //OPTIONAL  BEHAVIOR - Fire User Defined Event 1006
    //SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT); //OPTIONAL BEHAVIOR - Fire User Defined Event 1003
    //SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);      //OPTIONAL BEHAVIOR - Fire User Defined Event 1004
    //SetSpawnInCondition(NW_FLAG_DEATH_EVENT);            //OPTIONAL  BEHAVIOR - Fire User Defined Event 1007

// DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH)
//*****************************************************************************************
    SetListeningPatterns();    // Goes through and sets up which shouts  the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is  "POST_" + NPC TAG the creature will return this way point after
                               //    combat.

}
