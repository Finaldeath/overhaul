#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_M2Q3TalkedMary") == 10;
    return iResult;
}
