///////Checks if player going through Past Life scenario for second or later time

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALKDEJAVU") > 0;
    return iResult;
}

