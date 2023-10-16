#include "NW_I0_PLOT"
#include "M3PLotInclude"
int StartingConditional()
{
    return CheckIntelligenceLow() && PlayerHasGolemPassAmulet(GetPCSpeaker());;
    /////// && Check player has pass amulet (MAcAmFiGiantP3Q4)
}

