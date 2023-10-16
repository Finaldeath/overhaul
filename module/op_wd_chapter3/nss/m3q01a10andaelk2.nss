// * Low IQ, Elk Tribe Cured
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow()
        && GetLocalInt(GetModule(),"NW_G_M3Q03PLOTPLAGUECURED") != 1;
    return iResult;
}

