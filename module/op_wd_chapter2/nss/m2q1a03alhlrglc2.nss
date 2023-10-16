#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(), "M2Q1A03ALHLR_SAMPLE") == 10
    &&
    CheckIntelligenceNormal()
    ;
    return iResult;
}

