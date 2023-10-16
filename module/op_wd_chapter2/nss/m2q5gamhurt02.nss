#include "NW_I0_PLOT"

int StartingConditional()
{
    int GamHP = GetCurrentHitPoints(GetObjectByTag("M2Q05CGAM"));
    if ((GamHP < 11) && (GetCanCastHealingSpells(GetPCSpeaker())))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
