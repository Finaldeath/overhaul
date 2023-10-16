// Evaine has not been found, intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Evaine_Plot");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if ((iPlot == 0) && (iPlot2 == 0))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
