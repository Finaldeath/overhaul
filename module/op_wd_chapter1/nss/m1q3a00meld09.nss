#include "nw_i0_plot"

int StartingConditional()
{
    int bCondition = GetLocalInt(GetPCSpeaker(),"NW_FORMOSA_JOB_ACCEPTED") >= 1&&
                     GetIsObjectValid(GetObjectByTag("Formosa")) &&
                     CheckIntelligenceNormal();
    return bCondition;
}
