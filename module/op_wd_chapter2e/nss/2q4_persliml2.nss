#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Persuaded2");
    if (iPlot == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
