///////Used Recall Stone and normal int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_USED_RECALL")>0 &&
              CheckIntelligenceNormal();
    return iResult;
}

