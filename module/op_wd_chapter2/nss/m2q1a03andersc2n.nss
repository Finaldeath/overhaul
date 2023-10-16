#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetObjectByTag("M2Q1CALHE"), "NW_J_FETCHPLOT") >= 10 && CheckIntelligenceNormal();
    return iResult;
}

