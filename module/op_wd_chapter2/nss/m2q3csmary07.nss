#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_M2Q3TalkedMary") == 0;
    return iResult;
}
