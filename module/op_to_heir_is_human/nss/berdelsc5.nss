#include "NW_I0_PLOT"

int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"drowkey"))&&
    CheckIntelligenceLow();
}


