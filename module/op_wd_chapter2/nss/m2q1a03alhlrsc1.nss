#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;
    iResult =
    GetLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") == 10
    &&
    CheckIntelligenceNormal()
    ;
    return iResult;
}
