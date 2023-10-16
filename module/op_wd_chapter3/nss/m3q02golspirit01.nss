#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"SundialExplained") >=1
              && CheckIntelligenceNormal();
    return iResult;
}
