#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
             !GetIsObjectValid(GetObjectByTag("M2Q3WANEVDEMPORT"));
    return iResult;
}
