#include "nw_i0_plot"
#include "NW_J_RESCUE"

int StartingConditional()
{
    object M2Q2GSpirit = GetObjectByTag("M2Q2GSpirit") ;

    if (!GetIsObjectValid(M2Q2GSpirit) && GetLocalInt(OBJECT_SELF,"NW_L_SpiritReward") == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
