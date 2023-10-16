///// Check if
//////  Player has final Word of Power

#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"MPlUsWordofPoQ6"))
           && CheckIntelligenceLow();


    return iResult;
}


