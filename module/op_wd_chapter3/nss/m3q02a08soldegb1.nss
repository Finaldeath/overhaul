// * opens gate when player talks
#include "nw_i0_generic"

void main()
{
    object oDoor = GetNearestObjectByTag("Wall2Gate");
    SetLocked(oDoor, FALSE);
    ActionOpenDoor(oDoor);
    SetLocalInt(GetModule()," NW_G_M3Q02TALKPLAYERID",1);
    ActionDoCommand(WalkWayPoints());
}
