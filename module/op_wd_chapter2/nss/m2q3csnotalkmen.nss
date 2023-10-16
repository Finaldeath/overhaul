#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetPCSpeaker(),"NW_L_" + GetTag(OBJECT_SELF)) == 0;
    return iResult;
}
