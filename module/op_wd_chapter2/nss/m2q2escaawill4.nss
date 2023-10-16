#include "m2_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult =  GetPartyLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT") == 80 &&
               GetLocalInt(OBJECT_SELF,"NW_M2Q2E_LFINDSPIRIT") == 80 &&
               GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID1") == 3 &&
               GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID2") == 3 &&
               GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID3") == 3;
    return iResult;
}
