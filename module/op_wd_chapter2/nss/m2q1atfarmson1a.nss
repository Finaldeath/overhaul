#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M2Q01PLOTURTH") == 10 && CheckIntelligenceNormal();
    return iResult;
}
