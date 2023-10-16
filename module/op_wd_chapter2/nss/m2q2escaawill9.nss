#include "nw_i0_plot"


int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              !GetIsObjectValid(GetObjectByTag("M2Q2GSpirit")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_SpiritReward") == 0;
    return iResult;
}

