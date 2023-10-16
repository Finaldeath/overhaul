// PC has refused to kill Kurth in exchange for the children

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Londa_Plot");
    if (iPlot == 16)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
