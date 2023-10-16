#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(), "HEARD_ARKLEM");
    if (iPlot == 0)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
