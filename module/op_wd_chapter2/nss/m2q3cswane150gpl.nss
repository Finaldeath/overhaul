#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              HasGold(150,GetPCSpeaker());
    return iResult;
}
