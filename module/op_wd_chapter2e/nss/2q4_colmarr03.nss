#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Colmarr_Told_Invention");
    if (iPlot == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
