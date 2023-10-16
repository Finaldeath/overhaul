#include "NW_I0_Plot"

int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"NW_G_M1S2NoBribe") == FALSE &&
                     CheckIntelligenceNormal();
    return bCondition;
}
