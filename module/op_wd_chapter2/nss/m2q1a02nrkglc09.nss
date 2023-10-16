/* This script sets a local on the PC; the local is checked upon
speaking with this NCPC. If the local is 0 (and the intelligence
of the PC is normal), then the line of dialogue can be spoken. If
it is not 0, then the line cannot be spoken.*/

#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult =

    GetLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_KNOWS_NAME") == 0
    &&
    CheckIntelligenceNormal()

    ;
    return iResult;
}
