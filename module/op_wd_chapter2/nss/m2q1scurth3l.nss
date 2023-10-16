#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetIsObjectValid(GetObjectByTag("M2Q1SILVERCHARM"))
    &&
    CheckIntelligenceLow()
    ;
    return l_iResult;
}

