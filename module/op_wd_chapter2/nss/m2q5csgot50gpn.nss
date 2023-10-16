#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasGold(50,GetPCSpeaker()))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
