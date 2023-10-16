#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Player_Met_Elaith");
    if (iPlot == 2)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
