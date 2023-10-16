#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult = GetLocalInt(GetModule(),"Londa_Plot");
    if (iResult == 15)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
