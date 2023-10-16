// Kurth has told player that he has Evaine, intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if ((iPlot == 5) || (iPlot == 6))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
