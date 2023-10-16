#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(), "NW_G_M2Q05PLOTWIFE") == 10
    &&
    CheckIntelligenceLow();;
    return l_iResult;
}
