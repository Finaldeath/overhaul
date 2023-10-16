// the PC has been told the main plot
// and his Intelligence is low

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "Told_Main_Plot2");
    if ((nPlot == 1) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
