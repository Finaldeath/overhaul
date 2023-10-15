#include "nw_i0_plot"

int StartingConditional()
{
    int bCondition = CheckIntelligenceNormal() &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M0Q01TALKFLIRT") == 0;
    return bCondition;
}
