#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasGold(250,GetPCSpeaker()))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
