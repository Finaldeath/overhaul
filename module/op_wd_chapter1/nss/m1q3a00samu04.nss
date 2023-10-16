#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"NW_Thurin_Plot");
    if (iPlot != 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
