#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
             !GetIsObjectValid(GetObjectByTag("M2Q3WANEVDEMPORT"));
    return iResult;
}
