#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q1SILVERCHARM")) &&
                CheckIntelligenceNormal();
    return l_iResult;
}

