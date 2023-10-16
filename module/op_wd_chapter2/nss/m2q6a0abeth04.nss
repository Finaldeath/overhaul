#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if (iPlot == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
