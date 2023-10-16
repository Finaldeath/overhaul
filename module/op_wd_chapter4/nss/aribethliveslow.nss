///Aribeth alive and low int

#include "NW_I0_PLOT"

int StartingConditional()

{
    int iResult;

    iResult = GetIsObjectValid(GetObjectByTag("M4Q01B25ARIB")) && CheckIntelligenceLow();
    return iResult;
}
