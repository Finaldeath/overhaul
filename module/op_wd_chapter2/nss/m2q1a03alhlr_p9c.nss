#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") >= 30
    &&
    CheckIntelligenceLow()
    ;
    return iResult;
}
