#include "NW_I0_PLOT"

int StartingConditional()
{
    if (HasItem(GetPCSpeaker(),"2Q4_BaramHead"))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
