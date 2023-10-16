#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal()
            && GetLocalInt(GetPCSpeaker(), "M3Q04CDRAGONTALK") == 1;
}

