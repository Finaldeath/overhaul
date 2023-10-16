#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasGold(100,GetPCSpeaker()))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
