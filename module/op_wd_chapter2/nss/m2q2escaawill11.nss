#include "m2_i0_plot"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetPartyLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT") == 99 &&
              GetIsObjectValid(GetObjectByTag("M2Q2GSpirit")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_SpiritReward") == 0;
    return iResult;
}

