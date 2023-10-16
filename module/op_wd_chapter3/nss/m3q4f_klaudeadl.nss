#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow()
        && GetLocalInt(GetModule(),"NW_G_KLAUTHDEAD")!=99;
}

