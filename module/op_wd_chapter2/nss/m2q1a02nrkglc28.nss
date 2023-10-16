#include "m2_i0_plot"
#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;
    iResult =
    GetLocalInt(OBJECT_SELF, "NW_L_NEURIK_PLOT_STARTED") == 0
    &&
    GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") == 0
    &&
    CheckIntelligenceLow()
    ;
    return iResult;
}

