#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nRunningForTamsil") == 1  &&  GetLocalInt(OBJECT_SELF, "nAlreadyRan") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nAlreadyRan", 1);
        SetLocalInt(GetModule(), "nDurnanWentForTamsil", 1);
        location lTarget = GetLocation(GetWaypointByTag("wp_q2adurnan_rescue"));
        AssignCommand(OBJECT_SELF, ActionMoveToLocation(lTarget));
        DestroyObject(OBJECT_SELF, 5.0);
    }

}
