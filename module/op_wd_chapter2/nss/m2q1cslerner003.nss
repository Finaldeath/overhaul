#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasGold(600,GetPCSpeaker()) &&
              CheckIntelligenceNormal();
    return iResult;
}
