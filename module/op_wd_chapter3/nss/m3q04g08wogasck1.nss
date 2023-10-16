#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
           GetLocalInt(OBJECT_SELF, "NW_L_M3Q04TALKINFO1") == 0;

}

