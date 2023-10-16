#include "NW_I0_PLOT"

int StartingConditional()
{
    int Plot1 = GetLocalInt(GetModule(),"Chapter2_Know_Cult");
    if (Plot1 == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
