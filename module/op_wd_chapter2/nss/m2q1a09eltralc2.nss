#include "m2_i0_plot"
#include "NW_I0_PLOT"

int StartingConditional()
{
    return GetPartyLocalInt(GetPCSpeaker(), "M2Q1A09ELTRA_PLOT") != 0
    &&
    CheckIntelligenceNormal()
    &&
    GetLocalInt(GetModule(),"NW_G_FoundImaskTome") < 5;
}
