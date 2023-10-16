#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasItem(GetPCSpeaker(),"2Q4_BaramHead"))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
