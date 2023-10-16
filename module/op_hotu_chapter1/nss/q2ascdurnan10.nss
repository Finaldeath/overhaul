#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"q2undermountainquest")==40&&
                CheckIntelligenceLow();
    return iResult;
}

