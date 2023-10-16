// NW_D2_PARTY2+N
//
// If there is currently more than one PC party member
// and the PC's Intelligence is normal

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oFirst = GetFirstPC();
    object oSecond = GetNextPC();
    if ((GetIsObjectValid(oSecond)) && (CheckIntelligenceNormal()))
    {
        return TRUE;
    }
    return FALSE;
}
