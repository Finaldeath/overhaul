#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03IJHAREGJOU1")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03IJHAREGJOU2")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03IJHAREGJOU3")));
    return iResult;
}
