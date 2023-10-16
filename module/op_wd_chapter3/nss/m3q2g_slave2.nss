#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow()
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2G_SLAVE1")==0;
    return iResult;
}
