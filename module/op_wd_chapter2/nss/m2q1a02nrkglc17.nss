#include "NW_I0_Plot"

int StartingConditional()
{
    if (CheckIntelligenceLow())
    {
        return (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING01"))
        || GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING02"))
        || GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING03")));
    }
    return FALSE;
}


