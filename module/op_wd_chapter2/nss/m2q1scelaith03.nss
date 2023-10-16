// player has at least 1 level Rogue & low int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iClass = GetLevelByClass(CLASS_TYPE_ROGUE,GetPCSpeaker());
    if (iClass > 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
