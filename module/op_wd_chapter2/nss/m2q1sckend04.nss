// normal intelligence, bounty plot begun

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT");
    if (iPlot == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
