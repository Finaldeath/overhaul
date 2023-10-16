#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"NW_ELAITH_PLOT");
    if (iPlot == 2)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}

