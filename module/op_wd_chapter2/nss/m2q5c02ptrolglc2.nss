#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(), "M2Q5C02GOBLIN_FRIENDLY") != 10
    &&
    CheckIntelligenceNormal()
    ;
    return l_iResult;
}
