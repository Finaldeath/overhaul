#include "NW_I0_PLOT"
#include "m2_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult =  GetPartyLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT") == 10 &&
               GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker())>=1 &&
               CheckIntelligenceLow();
    return iResult;
}
