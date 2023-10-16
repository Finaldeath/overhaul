#include "m2_i0_plot"
#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;
    iResult =
    GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITALHTOOTH"))
    &&
    GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") >= 50
    &&
    GetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") <= 70
    &&
    CheckIntelligenceNormal()
    ;
    return iResult;
}


