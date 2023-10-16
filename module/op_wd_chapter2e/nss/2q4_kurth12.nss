// if the player already knows about the cult in the tower

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Know_Cult");
    if (iPlot == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
