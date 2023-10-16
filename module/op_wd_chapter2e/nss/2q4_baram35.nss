#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasItem(GetPCSpeaker(),"2Q4_Kurth_Head"))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
