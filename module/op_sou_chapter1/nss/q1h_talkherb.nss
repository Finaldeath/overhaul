// sets it so that the Herbalist knows the PC has already talked to him
// puts the herbalist back on his waypoints

#include "NW_I0_GENERIC"

void main()
{
    SetLocalInt(GetPCSpeaker(), "PC_Talk_Herbalist", 1);
    WalkWayPoints();
}
