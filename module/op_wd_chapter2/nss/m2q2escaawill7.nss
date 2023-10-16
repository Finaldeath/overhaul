#include "nw_i0_plot"
#include "NW_J_RESCUE"

int StartingConditional()
{
    object M2Q2GSpirit = GetPrisoner();
    if (!GetIsObjectValid(M2Q2GSpirit))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
