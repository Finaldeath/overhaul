#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q2ITDRUIDSEEDS")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_AllowPlanting") == 0;
    return iResult;
}
