// NW_D2_PARTY2+L
//
// If there is currently more than one PC party member
// and the PC's Intelligence is low

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oFirst = GetFirstPC();
    object oSecond = GetNextPC();
    if ((GetIsObjectValid(oSecond)) && (CheckIntelligenceLow()))
    {
        return TRUE;
    }
    return FALSE;
}
