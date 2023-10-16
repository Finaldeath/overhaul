#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              HasGold(300,GetPCSpeaker());
    return iResult;
}
