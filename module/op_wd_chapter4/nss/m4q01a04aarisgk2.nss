#include "NW_I0_PLOT"

int StartingConditional()

{

    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"MPlUsWordofPoQ6")) &&
              CheckIntelligenceLow();
    return iResult;
}

