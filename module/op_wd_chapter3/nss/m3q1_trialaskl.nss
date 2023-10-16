#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow()
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1_TRIALACCEPTED")==0;
    return iResult;
}
