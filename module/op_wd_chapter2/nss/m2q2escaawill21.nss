#include "NW_J_RESCUE"
#include "NW_I0_PLOT"

int StartingConditional()
{
    int bCondition =  ((GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID1") == 0) ||
    (GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID2") == 0) ||
    (GetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID3") == 0)) &&
    CheckIntelligenceNormal();
    return bCondition;
}
