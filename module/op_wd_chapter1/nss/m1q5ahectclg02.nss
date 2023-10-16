#include "NW_I0_Plot"
int StartingConditional()
{
    return GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_oAldo")) == FALSE &&
           GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_oMattily")) == FALSE &&
           CheckIntelligenceLow();
}

