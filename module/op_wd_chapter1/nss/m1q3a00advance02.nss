#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"FORMOSA_ADVANCE") &&
                   CheckIntelligenceLow();
    return bCondition;
}
