#include "m2_i0_plot"

int StartingConditional()
{
    return

    GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") >=10
    &&
    GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") <=40
    ;
}
