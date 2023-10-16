#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow()
            && GetLocalInt(GetPCSpeaker(), "M3Q04CDRAGONTALK") == 1;
}
