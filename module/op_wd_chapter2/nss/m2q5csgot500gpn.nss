#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasGold(500,GetPCSpeaker()))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
