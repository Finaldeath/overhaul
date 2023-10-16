// run check whether Kurth is dead or not, Intelligence low

#include "NW_I0_PLOT"

int StartingConditional()
{
    return ((GetLocalInt(GetModule(), "NW_2Q4_KURTH_IS_DEAD")) &&
            (CheckIntelligenceLow()));
}
