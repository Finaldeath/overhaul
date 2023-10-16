#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"q2undermountainquest")==99&&
                CheckIntelligenceNormal();
    return iResult;
}
