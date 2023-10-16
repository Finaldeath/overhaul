#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() &&
           GetLocalInt(OBJECT_SELF, "NW_L_M3Q04TALKINFO4") == 0;

}


