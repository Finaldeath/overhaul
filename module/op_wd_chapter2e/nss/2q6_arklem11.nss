#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"REASON_TO_FREE_ARKLEM");
    if (iPlot == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
