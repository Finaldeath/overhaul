#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              HasGold(50,GetPCSpeaker());
    return iResult;
}
