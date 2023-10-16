#include "m2_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult =  GetPartyLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT") == 0 &&
               GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker())>=1;
    return iResult;
}
