// * Normal IQ, Blankets
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && HasPlagueBlankets(GetPCSpeaker());
    return iResult;
}

