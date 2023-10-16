#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"Londa_Job");
    int iPlot2 = GetLocalInt(GetModule(),"Londa_Plot");
    if ((iPlot1 > 0) && (iPlot2 < 10))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
