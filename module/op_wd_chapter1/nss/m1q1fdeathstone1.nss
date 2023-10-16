///////Used Recall Stone and lowint

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_USED_RECALL")>0 &&
              CheckIntelligenceLow();
    return iResult;
}
