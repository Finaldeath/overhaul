#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Host_Tower_Bridge_Open");
    if (iPlot == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
