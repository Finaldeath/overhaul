#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetModule(),"NW_G_CheerUpErik") == 1;
    return iResult;
}
