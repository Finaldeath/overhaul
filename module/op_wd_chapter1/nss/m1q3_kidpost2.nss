#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetModule(),"NW_G_M1S1SubPlot") == 10;
    return iResult;
}

