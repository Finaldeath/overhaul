//// Checks if romance active and PC has normal int

#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET2"));
    return iResult;
}



