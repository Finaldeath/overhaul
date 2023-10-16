#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() && !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q3ITJOURNHERO"));
    return iResult;
}
