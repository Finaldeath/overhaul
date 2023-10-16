#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow()
    &&
    GetLocalInt(GetModule(), "NW_L_M2Q2E03AAWILL_B") == 20
    ;
}
