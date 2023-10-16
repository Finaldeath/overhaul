#include "nw_i0_plot"

int StartingConditional()
{
    int bCondition = GetLocalInt(GetPCSpeaker(),"NW_FORMOSA_DOUBLE_CROSS") &&
                     CheckIntelligenceLow();
    return bCondition;
}
