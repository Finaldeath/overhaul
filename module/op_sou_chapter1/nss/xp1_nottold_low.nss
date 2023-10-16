// the PC has not been told the main plot yet
// and his Intelligence is low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "Told_Main_Plot2");
    if ((nPlot == 0) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
