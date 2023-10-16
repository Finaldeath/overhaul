#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISCEPJARDAK")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISCEPNARI")));
    return iResult;
}
