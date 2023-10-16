// this global is set once the Fabulous Contrapulator has been fixed

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Contrapulator_Fixed");
    if (iPlot == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
