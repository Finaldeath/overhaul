//////Check if Maugrim is dead

#include "NW_I0_PLOT"

int StartingConditional()

{

    int iResult;

    iResult = !GetIsObjectValid(GetObjectByTag("M4Q01B26MAUG")) &&
              CheckIntelligenceLow();
    return iResult;
}


