#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALK2RESPONSE3") != 1 &&
               CheckIntelligenceLow();
    return l_iResult;
}
