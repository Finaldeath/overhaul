// empty so formians won't reposnd to shouts from nearby rooms

#include "nw_i0_generic"

void main()
{

    if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DIALOGUE));
    }
}
