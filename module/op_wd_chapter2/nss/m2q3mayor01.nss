#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = !GetIsDawn() && CheckIntelligenceNormal() && CheckWisdomHigh();
    return l_iResult;
}
