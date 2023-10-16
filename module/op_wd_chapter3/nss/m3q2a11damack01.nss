#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = HasGold(1500, GetPCSpeaker()) & CheckIntelligenceNormal();
    return iResult;
}
