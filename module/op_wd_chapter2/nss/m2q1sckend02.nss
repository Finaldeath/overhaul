// normal intelligence, bounty plot not begun

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT");
    if (iPlot == 0)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
