#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetObjectByTag("Formosa")) &&
                     CheckIntelligenceLow();
    return bCondition;
}
