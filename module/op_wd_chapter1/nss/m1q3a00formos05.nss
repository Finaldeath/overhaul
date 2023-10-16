#include "nw_i0_plot"

int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(),"NW_FORMOSA_JOB_ACCEPTED") == 0 &&
           CheckCharismaLow();
}
