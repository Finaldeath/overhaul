#include "nw_i0_plot"


int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              HasItem(GetPCSpeaker(),"M2Q2G_ANTIDOTE");
    return iResult;
}
