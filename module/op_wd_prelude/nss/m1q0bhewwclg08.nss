#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q0BRanged") == FALSE &&
                     CheckIntelligenceLow();

    return bCondition;
}
