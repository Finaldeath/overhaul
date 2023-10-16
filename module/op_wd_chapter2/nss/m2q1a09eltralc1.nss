#include "m2_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = GetPartyLocalInt(GetPCSpeaker(), "M2Q1A09ELTRA_PLOT") > 0 &&
              GetLocalInt(GetModule(),"NW_G_FoundImaskTome") < 5;
    return iResult;
}
