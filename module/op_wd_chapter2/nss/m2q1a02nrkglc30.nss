#include "m2_i0_plot"
#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
           GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") < 20;
}
