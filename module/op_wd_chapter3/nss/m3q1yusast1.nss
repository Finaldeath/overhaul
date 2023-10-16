// * Normal IQ, Elk Chief Dead
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() && ElkChiefDead();
    return iResult;
}
