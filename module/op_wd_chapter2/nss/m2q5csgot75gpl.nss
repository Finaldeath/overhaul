#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasGold(75,GetPCSpeaker()))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}

