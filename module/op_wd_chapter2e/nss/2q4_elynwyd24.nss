// player has agreed to kill Baram, intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iPlot == 5)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
