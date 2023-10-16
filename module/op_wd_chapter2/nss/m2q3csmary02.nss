#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              !GetIsObjectValid(GetNearestObjectByTag("M2Q03CBOY"));
    return iResult;
}
