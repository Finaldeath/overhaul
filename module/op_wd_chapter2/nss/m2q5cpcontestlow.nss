#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5KnowContest") == 0 && CheckIntelligenceLow();;
    return l_iResult;
}
