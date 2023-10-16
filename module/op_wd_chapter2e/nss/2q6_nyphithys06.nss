#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() && AutoDC(DC_MEDIUM, SKILL_LORE, GetPCSpeaker());
}

