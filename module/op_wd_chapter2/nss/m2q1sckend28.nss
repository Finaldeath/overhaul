// if Shaldrissa is not dead

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() &&
           GetLocalInt(GetModule(),"NW_G_SHALDRISSAISDEAD") == 0;
}
