#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_J_FETCHPLOT") == 30 &&
    CheckIntelligenceNormal();
    return iResult;
}
