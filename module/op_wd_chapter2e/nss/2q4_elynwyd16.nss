// Kurth reneged on the deal, intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iPlot == 9)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
