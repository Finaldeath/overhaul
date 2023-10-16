#include "NW_I0_Plot"
int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3A00TOOTH")) &&
           CheckIntelligenceLow();
}

