#include "NW_I0_Generic"
void main()
{
    object oDoor = GetNearestObjectByTag("M1Q3P_M1Q3A");
    SetLocked(oDoor,FALSE);
    ActionOpenDoor(oDoor);
    ActionDoCommand(WalkWayPoints());
}
