#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &
              GetLocalInt(OBJECT_SELF,"NW_L_Robbed") == 0;
    return iResult;
}
