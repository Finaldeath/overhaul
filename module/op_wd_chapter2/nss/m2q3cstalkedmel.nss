#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_" + GetTag(OBJECT_SELF)) == 10;
    return iResult;
}
