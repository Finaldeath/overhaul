#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetIsObjectValid(GetNearestObjectByTag("M2Q03CBOY"));
    return iResult;
}
