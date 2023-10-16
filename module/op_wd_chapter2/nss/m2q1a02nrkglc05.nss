#include "m2_i0_plot"

int StartingConditional()
{
    int iResult;
    iResult = GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") == 50;
    return iResult;
}
