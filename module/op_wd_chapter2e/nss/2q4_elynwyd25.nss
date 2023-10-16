// player has refused to kill Baram, intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iPlot == 6)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
