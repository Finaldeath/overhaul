////////Check if Maugrim is alive and intelligence normal

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetObjectByTag("M4Q01B26MAUG")) && CheckIntelligenceNormal();
    return iResult;
}

