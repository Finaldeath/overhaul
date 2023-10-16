/// Checks if Catapults still active and normal int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") < 2 &&
              CheckIntelligenceNormal();
    return iResult;
}

