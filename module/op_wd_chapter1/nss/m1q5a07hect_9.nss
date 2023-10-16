#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"
void main()
{
    SetLocalObject(GetModule(),"oHector104a",OBJECT_SELF);
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();

}
