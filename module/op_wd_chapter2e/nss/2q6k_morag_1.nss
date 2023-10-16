
#include "nw_i0_generic"
void main()
{
    if(GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1001));
    }
    else if (!GetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT) &&
              GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START") == 5)
    {
        // Sometimes Morags Spawn in Condition doesn't get set sometimes.
        // If it doesn't get set the cutscene wont start. This will fix the broken cutscene.
        SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
        SignalEvent(OBJECT_SELF, EventUserDefined(1001));
    }
}
