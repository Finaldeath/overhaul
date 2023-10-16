#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetObjectByTag("Formosa")) &&
                     CheckIntelligenceNormal();
    return bCondition;
}
