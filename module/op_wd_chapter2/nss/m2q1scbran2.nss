#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceNormal() && CheckWisdomHigh() && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING02"));
    return l_iResult;
}

