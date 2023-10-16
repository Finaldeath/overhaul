#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Player_Met_Elaith");
    if (iPlot == 3)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
