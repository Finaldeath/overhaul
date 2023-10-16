// Evaine has been found but not rescued, intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iPlot == 10)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
