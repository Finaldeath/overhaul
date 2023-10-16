#include "nw_i0_plot"

int StartingConditional()
{
    int iBetray = GetLocalInt(GetPCSpeaker(),"NW_ASSA_DOUBLE_CROSS");
    if (iBetray == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
