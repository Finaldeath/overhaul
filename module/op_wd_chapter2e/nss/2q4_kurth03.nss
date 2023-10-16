// Baram is already dead
#include "NW_I0_2Q4LUSKAN"
#include "NW_I0_PLOT"
int StartingConditional()
{
    int nLocal = GetLocalInt(GetModule(), "NW_2Q4_BARAM_IS_DEAD");
    if (nLocal == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
