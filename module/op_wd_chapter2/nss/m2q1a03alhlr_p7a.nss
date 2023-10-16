#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") >= 10 && CheckIntelligenceNormal() && CheckWisdomHigh();
    return iResult;
}

