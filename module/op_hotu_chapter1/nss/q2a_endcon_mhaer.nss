#include "NW_I0_GENERIC"
//if the PCs are talking to Mhaere - if its after the council scene
//she can walk waypoints.  Otherwise she needs to stand still so
//she's near durnan for his conversation.
void main()
{
    if (GetLocalInt(GetModule(), "nCutScene15Done") == 1)
        WalkWayPoints();
}
