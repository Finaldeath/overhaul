#include "NW_I0_Plot"
int StartingConditional()
{
    return (GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_oAldo")) == TRUE ||
            GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_oMattily")) == TRUE) &&
           CheckIntelligenceLow();
}
