// PC has agreed to kill Kurth in exchange for the children

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Londa_Plot");
    if (iPlot == 15)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
