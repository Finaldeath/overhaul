
// Make an extra wake-up check in addition to the gnoll HB

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    object oGnoll = GetNearestObjectByTag("Q3_GNOLL_GUARD");
    if(oGnoll == OBJECT_INVALID)
        return;

    SetLocalObject(oGnoll, "PC_TO_CHECK", oPC);
    SignalEvent(oGnoll, EventUserDefined(101));

}
