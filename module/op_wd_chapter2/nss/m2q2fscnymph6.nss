#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_M2Q2F_TERMEET") == 10 &&
    CheckIntelligenceNormal();
    return iResult;
}
