///Aribeth alive and normal int

#include "NW_I0_PLOT"

int StartingConditional()

{
    int iResult;

    iResult = GetIsObjectValid(GetObjectByTag("M4Q01B25ARIB")) && CheckIntelligenceNormal();
    return iResult;
}
