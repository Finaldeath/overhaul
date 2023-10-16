#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_Thurin_Plot") == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
