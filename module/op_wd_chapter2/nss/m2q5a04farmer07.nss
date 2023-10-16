#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Told_Gerrol_Plot");
    if (iPlot == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
