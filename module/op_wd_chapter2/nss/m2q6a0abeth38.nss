// player has low intelligence and is a cleric or paladin
#include "NW_I0_PLOT"

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
    if (nClass > 0)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
