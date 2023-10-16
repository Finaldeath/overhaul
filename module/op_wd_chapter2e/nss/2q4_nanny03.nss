#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Londa_Job");
    if ((iPlot != 1) && (iPlot != 2))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
