#include "NW_I0_Plot"
int StartingConditional()
{
    return CheckIntelligenceLow() && GetGold(GetPCSpeaker()) > 1;
}
