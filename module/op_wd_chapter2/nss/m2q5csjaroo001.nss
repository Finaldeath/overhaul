#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasGold(500,GetPCSpeaker()) &&
              CheckIntelligenceNormal();
    return iResult;
}
