#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = GetGold(GetPCSpeaker()) >= 500 && CheckIntelligenceLow();
    return iResult;
}

