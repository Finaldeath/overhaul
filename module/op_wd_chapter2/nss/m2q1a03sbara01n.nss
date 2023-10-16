#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal()
    &&
    GetLocalInt(OBJECT_SELF, "NW_G_M2Q1A03ELAITH01") == 10
    ;
}
