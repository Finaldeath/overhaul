#include "nw_i0_plot"

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_Resc_Plot") == 10)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
