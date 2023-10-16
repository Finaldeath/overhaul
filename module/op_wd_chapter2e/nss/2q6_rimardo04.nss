#include "NW_I0_PLOT"

int StartingConditional()
{
    int iClass = GetLevelByClass(CLASS_TYPE_ROGUE,GetPCSpeaker());
    if (!CheckWisdomHigh() && (iClass == 0))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
