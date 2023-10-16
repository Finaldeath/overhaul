#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceLow() &&GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITSILPOTION"));
    return l_iResult;
}
