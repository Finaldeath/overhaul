// Baram is already dead

#include "NW_I0_PLOT"
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "NW_2Q4_BARAM_IS_DEAD") == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
