#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;
    iResult =
    GetLocalInt(GetModule(), "NW_L_M2Q1A02NEURIK_PLOT") == 80
    &&
    CheckIntelligenceNormal()
    ;
    return iResult;
}
