#include "NW_I0_Generic"
void main()
{
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);
    SetLocalObject(GetModule(),"NW_G_oAldo",OBJECT_SELF);
    WalkWayPoints(TRUE);
}
