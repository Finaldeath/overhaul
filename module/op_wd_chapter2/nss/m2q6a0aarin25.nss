// is true so long as the player has not given the High Captain seal to Aarin

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(OBJECT_SELF,"Chapter2_Aarin_Made_Forgery");
    if (iPlot == 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
