#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_AskNeurikPortal") == 0;
    return iResult;
}
