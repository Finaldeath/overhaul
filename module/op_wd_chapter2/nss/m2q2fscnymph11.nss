#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(OBJECT_SELF,"NW_M2Q2NYMPH_NICE") == 10 && CheckIntelligenceLow();
    return iResult;
}

