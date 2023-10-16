#include "NW_I0_PLOT"
int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Talked_To_Aarin");
    if (iPlot == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}

