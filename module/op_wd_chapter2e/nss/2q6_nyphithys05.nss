#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && AutoDC(DC_MEDIUM, SKILL_LORE, GetPCSpeaker());
}
