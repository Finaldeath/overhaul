#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal()
        && GetLocalInt(GetModule(),"NW_G_KLAUTHDEAD")!=99;
}
