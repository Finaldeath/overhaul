// * Normal IQ, Blankets
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal()
        && HasYusamToken(GetPCSpeaker())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_YUSAMDREAM")==0;
    return iResult;
}



