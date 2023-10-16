#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasGold(1,GetPCSpeaker()))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
