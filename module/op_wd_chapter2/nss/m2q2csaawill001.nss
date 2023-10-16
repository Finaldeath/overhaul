#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
           GetLocalInt(OBJECT_SELF,"NW_L_Advance") == 0;
}
